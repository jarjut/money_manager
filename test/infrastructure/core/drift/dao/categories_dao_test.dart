import 'package:flutter_test/flutter_test.dart';
import 'package:moneymanager/domain/core/entities/transaction.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';
import 'package:moneymanager/infrastructure/core/drift/dao/categories_dao.dart';

import '../../../../helper/database.dart';

void main() {
  group('CategoriesDao', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late AppDatabase db;
    late CategoriesDao dao;

    setUp(() {
      db = constructDbTest();
      dao = db.categoriesDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('addCategory should return TCategory when success', () async {
      // Act
      final category = await dao.addCategory(
        name: 'CategoryName',
        type: TransactionType.income,
      );
      // Assert
      expect(category, isA<TCategory>());
      expect(category.name, 'CategoryName');
      expect(category.type, TransactionType.income);
    });

    test('getCategory should return TCategoryData when success', () async {
      // Arrange
      final parentCategory = await dao.addCategory(
        name: 'ParentCategoryName',
        type: TransactionType.income,
      );
      final category = await dao.addCategory(
        parentId: parentCategory.id,
        name: 'CategoryName',
        type: TransactionType.income,
      );
      // Act
      final result = await dao.getCategory(category.id);
      // Assert
      expect(result, isA<TCategoryData>());
      expect(result?.name, 'CategoryName');
      expect(result?.type, TransactionType.income);
      expect(result?.parentCategory?.name, 'ParentCategoryName');
    });

    test('getCategories should return list of TCategoryData when success',
        () async {
      // Arrange
      // Disable populate database
      await db.close();
      db = constructDbTest(populateDatabase: false);
      dao = db.categoriesDao;
      // Insert dummy categories
      const incomeLength = 6;
      const expenseLength = 5;
      await Future.wait([
        ...List.generate(
          incomeLength,
          (i) => dao.addCategory(
            name: 'CategoryName$i',
            type: TransactionType.income,
          ),
        ),
        ...List.generate(
          expenseLength,
          (i) => dao.addCategory(
            name: 'CategoryName$i',
            type: TransactionType.expense,
          ),
        ),
      ]);
      // Act
      final incomeCategories = await dao.getCategories(
        transactionType: TransactionType.income,
      );
      final expenseCategories = await dao.getCategories(
        transactionType: TransactionType.expense,
      );
      // Assert
      expect(incomeCategories, isA<List<TCategoryData>>());
      expect(incomeCategories.length, incomeLength);
      expect(expenseCategories, isA<List<TCategoryData>>());
      expect(expenseCategories.length, expenseLength);
    });

    test('updateCategories should update data when success', () async {
      // Arrange
      final parentCategory = await dao.addCategory(
        name: 'ParentCategoryName',
        type: TransactionType.income,
      );
      final category = await dao.addCategory(
        parentId: parentCategory.id,
        name: 'CategoryName',
        type: TransactionType.income,
      );
      // Act
      await dao.updateCategory(
        category.copyWith(name: 'NewCategoryName'),
      );
      // Assert
      final result = await dao.getCategory(category.id);
      expect(result?.name, 'NewCategoryName');
    });

    test('softDeleteCategory should change deletedAt to not null', () async {
      // Arrange
      final category = await dao.addCategory(
        name: 'CategoryName',
        type: TransactionType.income,
      );
      // Act
      await dao.softDeleteCategory(category);
      // Assert
      final result = await dao.getCategory(category.id);
      expect(result, isNull);
    });
  });
}
