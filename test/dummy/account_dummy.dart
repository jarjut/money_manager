import 'package:moneymanager/domain/core/entities/entities.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';

final dummyTAccount = TAccount(
  id: 1,
  accountGroupId: 1,
  name: 'name',
  currency: '',
  origin: true,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
);

final dummyTAccountGroup = TAccountGroup(
  id: 1,
  name: 'name',
  origin: true,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
);

final dummyTAccountData = TAccountData(
  account: dummyTAccount,
  accountGroup: dummyTAccountGroup,
);

final dummyAccountGroup = AccountGroup(
  id: 1,
  name: 'name',
  origin: true,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
);

final dummyAccount = Account(
  id: 1,
  name: 'name',
  origin: true,
  accountGroup: dummyAccountGroup,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
);
