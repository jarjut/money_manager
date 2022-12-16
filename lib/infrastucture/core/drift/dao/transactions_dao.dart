import 'package:drift/drift.dart';
import 'package:moneymanager/domain/entities/transaction.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';
import 'package:moneymanager/infrastucture/core/drift/database/tables.dart';
import 'package:moneymanager/infrastucture/core/drift/models/t_account_data.dart';
import 'package:moneymanager/infrastucture/core/drift/models/t_transaction_data.dart';

part 'transactions_dao.g.dart';

/// {@template transactions_dao}
/// Data Access Object for Transactions.
/// {@endtemplate}
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
    required int fromAccountId,
    int? toAccountId,
    required double amount,
    String? note,
    String? description,
    required DateTime date,
  }) async {
    final result = await into(tTransactions).insertReturning(
      TTransactionsCompanion.insert(
        categoryId: categoryId,
        type: type,
        from: fromAccountId,
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
      innerJoin(
        from,
        tTransactions.from.equalsExp(from.id),
      ),
      innerJoin(
        fromGroup,
        from.id.equalsExp(fromGroup.id),
      ),
      leftOuterJoin(
        to,
        tTransactions.to.equalsExp(to.id),
      ),
      innerJoin(
        toGroup,
        to.id.equalsExp(toGroup.id),
      ),
    ]);
    final result = await query.getSingleOrNull();
    if (result == null) return null;

    final transaction = result.readTable(tTransactions);
    final category = result.readTable(tCategories);
    final parentCategory = result.readTableOrNull(parentCategories);
    final fromAccount = result.readTable(from);
    final fromAccountGroup = result.readTable(fromGroup);
    final toAccount = result.readTableOrNull(to);
    final toAccountGroup = result.readTableOrNull(toGroup);
    return TTransactionData(
      transaction: transaction,
      category: TCategoryData.fromTableClass(category, parentCategory),
      from: TAccountData(account: fromAccount, accountGroup: fromAccountGroup),
      to: toAccount != null
          ? TAccountData(account: toAccount, accountGroup: toAccountGroup!)
          : null,
    );
  }
}
