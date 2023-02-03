import 'package:moneymanager/domain/core/entities/entities.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';

final dummyTCategory = TCategory(
  id: 1,
  name: 'categoryName',
  iconName: 'iconName',
  iconColorName: 'iconColorName',
  type: TransactionType.expense,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
  hidden: false,
);

final dummyTCategoryData = TCategoryData(
  id: 1,
  name: 'categoryName',
  iconName: 'iconName',
  iconColorName: 'iconColorName',
  type: TransactionType.expense,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
  hidden: false,
);

final dummyCategory = TransactionCategory(
  id: 1,
  name: 'categoryName',
  iconName: 'iconName',
  iconColorName: 'iconColorName',
  type: TransactionType.expense,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
  hidden: false,
);
