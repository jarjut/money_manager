import 'package:moneymanager/domain/core/entities/entities.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';

class TAccountData {
  const TAccountData({
    required this.account,
    required this.accountGroup,
    this.balance = 0,
  });

  final TAccount account;
  final TAccountGroup accountGroup;
  final double balance;

  factory TAccountData.fromEntity(Account entity) {
    return TAccountData(
      account: TAccount(
        id: entity.id,
        name: entity.name,
        origin: entity.origin,
        accountGroupId: entity.accountGroup.id,
        currency: '',
        description: '',
        icon: '',
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        deletedAt: entity.deletedAt,
      ),
      accountGroup: TAccountGroup(
        id: entity.accountGroup.id,
        name: entity.accountGroup.name,
        origin: entity.accountGroup.origin,
        createdAt: entity.accountGroup.createdAt,
        updatedAt: entity.accountGroup.updatedAt,
        deletedAt: entity.accountGroup.deletedAt,
      ),
      balance: entity.balance,
    );
  }

  Account toEntity() {
    return Account(
      id: account.id,
      name: account.name,
      origin: account.origin,
      createdAt: account.createdAt,
      updatedAt: account.updatedAt,
      deletedAt: account.deletedAt,
      balance: balance,
      accountGroup: AccountGroup(
        id: accountGroup.id,
        name: accountGroup.name,
        origin: accountGroup.origin,
        createdAt: accountGroup.createdAt,
        updatedAt: accountGroup.updatedAt,
        deletedAt: accountGroup.deletedAt,
      ),
    );
  }
}
