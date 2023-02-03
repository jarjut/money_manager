import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:moneymanager/domain/core/entities/transaction.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';
import 'package:moneymanager/infrastructure/core/drift/database/tables.dart';

part 'accounts_dao.g.dart';

@lazySingleton
@DriftAccessor(
  tables: [
    TAccounts,
    TAccountGroups,
    TTransactions,
  ],
)
class AccountsDao extends DatabaseAccessor<AppDatabase>
    with _$AccountsDaoMixin {
  AccountsDao(super.db);

  // ====== Account Groups ======
  /// Add new account group
  Future<TAccountGroup> addAccountGroup({
    required String name,
  }) async {
    final result = await into(tAccountGroups).insertReturning(
      TAccountGroupsCompanion.insert(
        name: name,
      ),
    );
    return result;
  }

  // ====== Account ======

  /// Add new account
  Future<TAccount> addAccount({
    required String name,
    required int accountGroupId,
    double? initialBalance,
  }) async {
    return transaction<TAccount>(() async {
      // Add account
      final result = await into(tAccounts).insertReturning(
        TAccountsCompanion.insert(
          name: name,
          accountGroupId: accountGroupId,
        ),
      );
      // Add transaction to add initial balance
      if (initialBalance != null && initialBalance != 0) {
        final type = initialBalance > 0
            ? TransactionType.income
            : TransactionType.expense;
        final isIncome = type == TransactionType.income;
        final amount = initialBalance.abs();
        await into(tTransactions).insertReturning(
          TTransactionsCompanion.insert(
            categoryId: isIncome
                ? categoryModBalanceIncomeId
                : categoryModBalanceExpenseId,
            type: type,
            from: isIncome ? const Value.absent() : Value(result.id),
            to: isIncome ? Value(result.id) : const Value.absent(),
            amount: amount,
            date: DateTime.now(),
          ),
        );
      }
      return result;
    });
  }

  /// Get All accounts with account group
  Future<List<TAccountData>> getAllAccounts() async {
    final expenses = alias(tTransactions, 'expenses');
    final incomes = alias(tTransactions, 'incomes');
    final expensesSum = expenses.amount.sum();
    final incomesSum = incomes.amount.sum();
    final query = select(tAccounts).join([
      innerJoin(
        tAccountGroups,
        tAccounts.accountGroupId.equalsExp(tAccountGroups.id),
      ),
      leftOuterJoin(
        expenses,
        expenses.from.equalsExp(tAccounts.id),
        useColumns: false,
      ),
      leftOuterJoin(
        incomes,
        incomes.to.equalsExp(tAccounts.id),
        useColumns: false,
      ),
    ])
      ..where(tAccounts.deletedAt.isNull())
      ..addColumns([expensesSum, incomesSum])
      ..groupBy([expenses.id, incomes.id]);

    final result = await query.get();
    return result.map((row) {
      final account = row.readTable(tAccounts);
      final accountGroup = row.readTable(tAccountGroups);
      final balance =
          (row.read(incomesSum) ?? 0) - (row.read(expensesSum) ?? 0);
      return TAccountData(
        account: account,
        accountGroup: accountGroup,
        balance: balance,
      );
    }).toList();
  }

  /// Get account by id
  Future<TAccountData?> getAccount(int id) async {
    final expenses = alias(tTransactions, 'expenses');
    final incomes = alias(tTransactions, 'incomes');
    final expensesSum = expenses.amount.sum();
    final incomesSum = incomes.amount.sum();
    final query = select(tAccounts).join([
      innerJoin(
        tAccountGroups,
        tAccounts.accountGroupId.equalsExp(tAccountGroups.id),
      ),
      leftOuterJoin(
        expenses,
        expenses.from.equalsExp(tAccounts.id),
        useColumns: false,
      ),
      leftOuterJoin(
        incomes,
        incomes.to.equalsExp(tAccounts.id),
        useColumns: false,
      ),
    ])
      ..where(tAccounts.deletedAt.isNull())
      ..where(tAccounts.id.equals(id))
      ..addColumns([expensesSum, incomesSum])
      ..groupBy([expenses.id, incomes.id]);

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    final account = result.readTable(tAccounts);
    final accountGroup = result.readTable(tAccountGroups);
    final balance =
        (result.read(incomesSum) ?? 0) - (result.read(expensesSum) ?? 0);
    return TAccountData(
      account: account,
      accountGroup: accountGroup,
      balance: balance,
    );
  }

  /// Update an account
  Future<void> updateAccount({
    required TAccount account,
    double balanceChange = 0,
  }) async {
    return transaction(() async {
      // Update account
      await update(tAccounts).replace(
        account.copyWith(
          updatedAt: DateTime.now(),
        ),
      );
      // Add transaction to modify balance
      if (balanceChange != 0) {
        final type = balanceChange > 0
            ? TransactionType.income
            : TransactionType.expense;
        final isIncome = type == TransactionType.income;
        final amount = balanceChange.abs();
        await into(tTransactions).insertReturning(
          TTransactionsCompanion.insert(
            categoryId: isIncome
                ? categoryModBalanceIncomeId
                : categoryModBalanceExpenseId,
            type: type,
            from: isIncome ? const Value.absent() : Value(account.id),
            to: isIncome ? Value(account.id) : const Value.absent(),
            amount: amount,
            date: DateTime.now(),
          ),
        );
      }
    });
  }

  /// Delete an account
  ///
  /// This will not delete the account but mark it as deleted
  Future<void> softDeleteAccount(TAccount account) async {
    await update(tAccounts).replace(
      account.copyWith(
        updatedAt: DateTime.now(),
        deletedAt: Value(DateTime.now()),
      ),
    );
  }
}
