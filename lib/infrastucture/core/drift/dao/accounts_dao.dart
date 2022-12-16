import 'package:drift/drift.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';
import 'package:moneymanager/infrastucture/core/drift/database/tables.dart';
import 'package:moneymanager/infrastucture/core/drift/models/t_account_data.dart';

part 'accounts_dao.g.dart';

@DriftAccessor(
  tables: [
    TAccounts,
    TAccountGroups,
  ],
)
class AccountsDao extends DatabaseAccessor<AppDatabase>
    with _$AccountsDaoMixin {
  AccountsDao(super.db);

  /// Get All accounts with account group
  Future<List<TAccountData>> getAllAccounts() async {
    final query = select(tAccounts).join([
      innerJoin(
        tAccountGroups,
        tAccounts.accountGroupId.equalsExp(tAccountGroups.id),
      ),
    ]);
    final result = await query.get();
    return result.map((row) {
      final account = row.readTable(tAccounts);
      final accountGroup = row.readTable(tAccountGroups);
      return TAccountData(account: account, accountGroup: accountGroup);
    }).toList();
  }
}
