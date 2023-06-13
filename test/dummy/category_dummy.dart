import 'package:moneymanager/domain/core/entities/entities.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';

final dummyParentTCategory = TCategory(
  id: 1,
  name: 'parentCategoryName',
  iconName: 'iconName',
  iconColorName: 'iconColorName',
  type: TransactionType.expense,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
  hidden: false,
);

final dummyTCategory = TCategory(
  id: 2,
  categoryId: 1,
  name: 'categoryName',
  iconName: 'iconName',
  iconColorName: 'iconColorName',
  type: TransactionType.expense,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
  hidden: false,
);

final dummyParentTCategoryData = TCategoryData(
  id: 1,
  name: 'parentCategoryName',
  iconName: 'iconName',
  iconColorName: 'iconColorName',
  type: TransactionType.expense,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
  hidden: false,
);

final dummyTCategoryData = TCategoryData(
  id: 2,
  categoryId: 1,
  parentCategory: dummyParentTCategoryData,
  name: 'categoryName',
  iconName: 'iconName',
  iconColorName: 'iconColorName',
  type: TransactionType.expense,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
  hidden: false,
);

final dummyParentCategory = TransactionCategory(
  id: 1,
  name: 'parentCategoryName',
  iconName: 'iconName',
  iconColorName: 'iconColorName',
  type: TransactionType.expense,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
);

final dummyCategory = TransactionCategory(
  id: 2,
  categoryId: 1,
  parentCategory: dummyParentCategory,
  name: 'categoryName',
  iconName: 'iconName',
  iconColorName: 'iconColorName',
  type: TransactionType.expense,
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
);
