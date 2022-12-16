import 'package:moneymanager/domain/entities/entities.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';

class TAccountData {
  const TAccountData({
    required this.account,
    required this.accountGroup,
  });

  final TAccount account;
  final TAccountGroup accountGroup;

  Account toEntity() {
    return Account(
      id: account.id,
      name: account.name,
      origin: account.origin,
      accountGroup: AccountGroup(
        id: accountGroup.id,
        name: accountGroup.name,
        origin: accountGroup.origin,
      ),
    );
  }
}
