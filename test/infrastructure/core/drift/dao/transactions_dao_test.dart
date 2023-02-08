import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moneymanager/domain/core/entities/entities.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';
import 'package:moneymanager/infrastructure/core/drift/dao/accounts_dao.dart';
import 'package:moneymanager/infrastructure/core/drift/dao/transactions_dao.dart';

import '../../../../helper/database.dart';

void main() {
  group('TransactionsDao', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late AppDatabase db;
    late TransactionsDao dao;
    late AccountsDao accountsDao;
    // Pre-data
    late TAccount account1;
    late TAccount account2;
    late TCategory incomeCategory;
    late TCategory expenseCategory;
    const initialBalance1 = 100.0;
    const initialBalance2 = 200.0;

    setUp(() async {
      db = constructDbTest();
      dao = db.transactionsDao;
      accountsDao = db.accountsDao;
      // Add some data to the database
      final accountGroup =
          await db.accountsDao.addAccountGroup(name: 'GroupName');
      account1 = await db.accountsDao.addAccount(
        name: 'Account1',
        accountGroupId: accountGroup.id,
        initialBalance: initialBalance1,
      );
      account2 = await db.accountsDao.addAccount(
        name: 'Account2',
        accountGroupId: accountGroup.id,
        initialBalance: initialBalance2,
      );
      incomeCategory = await db.categoriesDao.addCategory(
        name: 'Income',
        type: TransactionType.income,
      );
      expenseCategory = await db.categoriesDao.addCategory(
        name: 'Expense',
        type: TransactionType.expense,
      );
    });

    tearDown(() async {
      await db.close();
    });

    group('addTransaction', () {
      test('should return TTransaction when success', () async {
        // act
        final transaction = await dao.addTransaction(
          type: TransactionType.expense,
          amount: 100,
          fromAccountId: account1.id,
          categoryId: expenseCategory.id,
          date: DateTime.now(),
        );
        // assert
        expect(transaction, isA<TTransaction>());
      });

      test('add income will add balance to the account', () async {
        // act
        final transaction = await dao.addTransaction(
          type: TransactionType.income,
          amount: 100,
          toAccountId: account1.id,
          categoryId: incomeCategory.id,
          date: DateTime.now(),
        );
        // assert
        final account = await accountsDao.getAccount(account1.id);
        expect(transaction, isA<TTransaction>());
        expect(account!.balance, initialBalance1 + 100);
      });

      test('add expense will subtract balance from the account', () async {
        // act
        final transaction = await dao.addTransaction(
          type: TransactionType.expense,
          amount: 100,
          fromAccountId: account1.id,
          categoryId: expenseCategory.id,
          date: DateTime.now(),
        );
        // assert
        final account = await accountsDao.getAccount(account1.id);
        expect(transaction, isA<TTransaction>());
        expect(account!.balance, initialBalance1 - 100);
      });

      test(
          'add transfer will subtract balance from the fromAccount and add '
          'balance to the toAccount', () async {
        // act
        final transaction = await dao.addTransaction(
          type: TransactionType.transfer,
          amount: 100,
          fromAccountId: account1.id,
          toAccountId: account2.id,
          categoryId: categoryTransferId,
          date: DateTime.now(),
        );
        // assert
        final fromAccount = await accountsDao.getAccount(account1.id);
        final toAccount = await accountsDao.getAccount(account2.id);
        expect(transaction, isA<TTransaction>());
        expect(fromAccount!.balance, initialBalance1 - 100);
        expect(toAccount!.balance, initialBalance2 + 100);
      });
    });

    test(
        'getTransaction should return TTransactionData when '
        'success', () async {
      // Arrange
      final transaction = await dao.addTransaction(
        type: TransactionType.transfer,
        amount: 100,
        fromAccountId: account1.id,
        toAccountId: account2.id,
        categoryId: categoryTransferId,
        date: DateTime.now(),
      );
      // Act
      final result = await dao.getTransaction(transaction.id);
      // Assert
      expect(result, isA<TTransactionData>());
      expect(result?.from?.account.name, 'Account1');
      expect(result?.from?.accountGroup.name, 'GroupName');
      expect(result?.to?.account.name, 'Account2');
      expect(result?.to?.accountGroup.name, 'GroupName');
      expect(result?.transaction.amount, 100);
    });

    group('getTransactions', () {
      setUp(() async {
        // Add some transactions
        await Future.wait([
          dao.addTransaction(
            description: 'Transaction 1',
            type: TransactionType.income,
            amount: 100,
            toAccountId: account1.id,
            categoryId: incomeCategory.id,
            date: DateTime(2022, 2, 2, 6), // 2/2/2022 6:00 AM
          ),
          dao.addTransaction(
            description: 'Transaction 2',
            type: TransactionType.expense,
            amount: 100,
            fromAccountId: account1.id,
            categoryId: expenseCategory.id,
            date: DateTime(2022, 2, 2, 7), // 2/2/2022 7:00 AM
          ),
          dao.addTransaction(
            description: 'Transaction 3',
            type: TransactionType.expense,
            amount: 100,
            fromAccountId: account1.id,
            categoryId: expenseCategory.id,
            date: DateTime(2022, 2, 3, 6), // 2/3/2022 6:00 AM
          ),
          dao.addTransaction(
            description: 'Transaction 4',
            type: TransactionType.transfer,
            amount: 100,
            fromAccountId: account1.id,
            toAccountId: account2.id,
            categoryId: categoryTransferId,
            date: DateTime(2022, 2, 3, 7), // 2/3/2022 7:00 AM
          ),
        ]);
      });
      test('should get list of TTransactionData when success', () async {
        // Act
        final result = await dao.getTransactions();
        // Assert
        expect(result, isA<List<TTransactionData>>());
        expect(result.length, 4 + 2); // +2 from account 1&2 initial balance
      });
      test('filter by date', () async {
        // Act
        final result = await dao.getTransactions(
          fromDate: DateTime(2022, 2, 2),
          toDate: DateTime(2022, 2, 3),
        );
        // Assert
        expect(result.length, 2);
        // Should be sorted by date
        expect(result.first.transaction.description, 'Transaction 2');
      });
      test('filter by transactionType', () async {
        // Act
        final result = await dao.getTransactions(
          type: TransactionType.expense,
        );
        // Assert
        expect(result.length, 2);
      });
      test('filter by account', () async {
        // Act
        final result = await dao.getTransactions(
          accountId: account1.id,
        );
        // Assert
        expect(result.length, 4 + 1); // +1 from account 1 initial balance
      });
      test('filter by category', () async {
        // Act
        final result = await dao.getTransactions(
          categoryId: expenseCategory.id,
        );
        // Assert
        expect(result.length, 2);
      });
    });

    test('updateTransaction should change data when success', () async {
      // Arrange
      final transaction = await dao.addTransaction(
        categoryId: incomeCategory.id,
        type: TransactionType.income,
        amount: 100,
        description: 'Transaction',
        date: DateTime.now(),
      );
      // Act
      await dao.updateTransaction(
        transaction.copyWith(
          description: const Value('Updated Transaction'),
          amount: 200,
        ),
      );
      // Assert
      final result = await dao.getTransaction(transaction.id);
      expect(result?.transaction.description, 'Updated Transaction');
      expect(result?.transaction.amount, 200);
    });

    test('deleteTransaction should delete data when success', () async {
      // Arrange
      final transaction = await dao.addTransaction(
        categoryId: incomeCategory.id,
        type: TransactionType.income,
        amount: 100,
        description: 'Transaction',
        date: DateTime.now(),
      );
      // Act
      await dao.deleteTransaction(transaction.id);
      // Assert
      final result = await dao.getTransaction(transaction.id);
      expect(result, null);
    });
  });
}
