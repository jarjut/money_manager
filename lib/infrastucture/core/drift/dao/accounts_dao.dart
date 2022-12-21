import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';
import 'package:moneymanager/infrastucture/core/drift/database/tables.dart';

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
      final result = await into(tAccounts).insertReturning(
        TAccountsCompanion.insert(
          name: name,
          accountGroupId: accountGroupId,
        ),
      );
      // TODO(jarjut): Add initial balance transaction
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
      await update(tAccounts).replace(
        account.copyWith(
          updatedAt: DateTime.now(),
        ),
      );
      if (balanceChange != 0) {
        // TODO(jarjut): Add balance change transaction

        // if (balanceChange > 0) add income transaction
        // else add expense transaction
      }
    });
  }

  /// Delete an account
  ///
  /// This will not delete the account but mark it as deleted
  Future<void> softDeleteAccount(TAccount account) async {
    return transaction(() async {
      await update(tAccounts).replace(
        account.copyWith(
          updatedAt: DateTime.now(),
          deletedAt: Value(DateTime.now()),
        ),
      );
    });
  }
}
