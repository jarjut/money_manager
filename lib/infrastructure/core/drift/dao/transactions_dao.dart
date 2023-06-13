import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:moneymanager/domain/core/entities/transaction.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';
import 'package:moneymanager/infrastructure/core/drift/database/tables.dart';

part 'transactions_dao.g.dart';

/// {@template transactions_dao}
/// Data Access Object for Transactions.
/// {@endtemplate}
@lazySingleton
@DriftAccessor(
  tables: [
    TTransactions,
    TCategories,
    TAccounts,
    TAccountGroups,
  ],
)
class TransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionsDaoMixin {
  /// {@macro transactions_dao}
  TransactionsDao(super.db);

  /// Add a new transaction
  Future<TTransaction> addTransaction({
    required int categoryId,
    required TransactionType type,
    required double amount, required DateTime date, int? fromAccountId,
    int? toAccountId,
    String? note,
    String? description,
  }) async {
    final result = await into(tTransactions).insertReturning(
      TTransactionsCompanion.insert(
        categoryId: categoryId,
        type: type,
        from: Value(fromAccountId),
        to: Value(toAccountId),
        amount: amount,
        note: Value(note),
        description: Value(description),
        date: date,
      ),
    );
    return result;
  }

  /// Get a transaction by id
  Future<TTransactionData?> getTransaction(int id) async {
    final parentCategories = alias(tCategories, 'parent_categories');
    final from = alias(tAccounts, 'from');
    final fromGroup = alias(tAccountGroups, 'from_group');
    final to = alias(tAccounts, 'to');
    final toGroup = alias(tAccountGroups, 'to_group');
    final query = select(tTransactions).join([
      innerJoin(
        tCategories,
        tTransactions.categoryId.equalsExp(tCategories.id),
      ),
      leftOuterJoin(
        parentCategories,
        tCategories.categoryId.equalsExp(parentCategories.id),
      ),
      leftOuterJoin(
        from,
        tTransactions.from.equalsExp(from.id),
      ),
      leftOuterJoin(
        fromGroup,
        from.accountGroupId.equalsExp(fromGroup.id),
      ),
      leftOuterJoin(
        to,
        tTransactions.to.equalsExp(to.id),
      ),
      leftOuterJoin(
        toGroup,
        to.accountGroupId.equalsExp(toGroup.id),
      ),
    ])
      ..where(tTransactions.id.equals(id));
    final result = await query.getSingleOrNull();
    if (result == null) return null;

    final transaction = result.readTable(tTransactions);
    final category = result.readTable(tCategories);
    final parentCategory = result.readTableOrNull(parentCategories);
    final fromAccount = result.readTableOrNull(from);
    final fromAccountGroup = result.readTableOrNull(fromGroup);
    final toAccount = result.readTableOrNull(to);
    final toAccountGroup = result.readTableOrNull(toGroup);
    return TTransactionData(
      transaction: transaction,
      category: TCategoryData.fromTableClass(category, parentCategory),
      from: fromAccount != null
          ? TAccountData(account: fromAccount, accountGroup: fromAccountGroup!)
          : null,
      to: toAccount != null
          ? TAccountData(account: toAccount, accountGroup: toAccountGroup!)
          : null,
    );
  }

  /// Get all transactions
  Future<List<TTransactionData>> getTransactions({
    DateTime? fromDate,
    DateTime? toDate,
    int? categoryId,
    int? accountId,
    TransactionType? type,
  }) async {
    final parentCategories = alias(tCategories, 'parent_categories');
    final from = alias(tAccounts, 'from');
    final fromGroup = alias(tAccountGroups, 'from_group');
    final to = alias(tAccounts, 'to');
    final toGroup = alias(tAccountGroups, 'to_group');
    final query = select(tTransactions).join([
      innerJoin(
        tCategories,
        tTransactions.categoryId.equalsExp(tCategories.id),
      ),
      leftOuterJoin(
        parentCategories,
        tCategories.categoryId.equalsExp(parentCategories.id),
      ),
      leftOuterJoin(
        from,
        tTransactions.from.equalsExp(from.id),
      ),
      leftOuterJoin(
        fromGroup,
        from.accountGroupId.equalsExp(fromGroup.id),
      ),
      leftOuterJoin(
        to,
        tTransactions.to.equalsExp(to.id),
      ),
      leftOuterJoin(
        toGroup,
        to.accountGroupId.equalsExp(toGroup.id),
      ),
    ]);
    if (fromDate != null) {
      query.where(tTransactions.date.isBiggerOrEqualValue(fromDate));
    }
    if (toDate != null) {
      query.where(tTransactions.date.isSmallerOrEqualValue(toDate));
    }
    if (categoryId != null) {
      query.where(tTransactions.categoryId.equals(categoryId));
    }
    if (accountId != null) {
      query.where(
        tTransactions.from.equals(accountId) |
            tTransactions.to.equals(accountId),
      );
    }
    if (type != null) {
      query.where(tTransactions.type.equalsValue(type));
    }
    query.orderBy([
      OrderingTerm(expression: tTransactions.date, mode: OrderingMode.desc),
    ]);
    final result = await query.get();
    return result.map((row) {
      final transaction = row.readTable(tTransactions);
      final category = row.readTable(tCategories);
      final parentCategory = row.readTableOrNull(parentCategories);
      final fromAccount = row.readTableOrNull(from);
      final fromAccountGroup = row.readTableOrNull(fromGroup);
      final toAccount = row.readTableOrNull(to);
      final toAccountGroup = row.readTableOrNull(toGroup);
      return TTransactionData(
        transaction: transaction,
        category: TCategoryData.fromTableClass(category, parentCategory),
        from: fromAccount != null
            ? TAccountData(
                account: fromAccount,
                accountGroup: fromAccountGroup!,
              )
            : null,
        to: toAccount != null
            ? TAccountData(account: toAccount, accountGroup: toAccountGroup!)
            : null,
      );
    }).toList();
  }

  /// Update a transaction
  Future<void> updateTransaction(TTransaction transaction) async {
    await update(tTransactions).replace(
      transaction.copyWith(
        updatedAt: DateTime.now(),
      ),
    );
  }

  /// Delete a transaction
  Future<void> deleteTransaction(int id) async {
    await (delete(tTransactions)..where((t) => t.id.equals(id))).go();
  }
}
