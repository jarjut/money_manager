import 'package:moneymanager/domain/entities/entities.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';

final dummyTCategoryData = TCategoryData(
  id: 1,
  name: 'categoryName',
  iconName: 'iconName',
  iconColorName: 'iconColorName',
  type: TransactionType.expense,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
);

final dummyCategory = TransactionCategory(
  id: 1,
  name: 'categoryName',
  iconName: 'iconName',
  iconColorName: 'iconColorName',
  type: TransactionType.expense,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
);
