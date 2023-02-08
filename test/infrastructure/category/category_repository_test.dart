// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moneymanager/domain/category/category_failure.dart';
import 'package:moneymanager/domain/core/entities/transaction.dart';
import 'package:moneymanager/infrastructure/category/category_repository.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';
import 'package:moneymanager/infrastructure/core/drift/dao/categories_dao.dart';

import '../../dummy/category_dummy.dart';

class MockCategoriesDao extends Mock implements CategoriesDao {}

class FakeTCategories extends Fake implements TCategory {}

void main() {
  group('CategoryRepository', () {
    late CategoriesDao mockDao;
    late CategoryRepository categoryRepository;

    setUp(() {
      mockDao = MockCategoriesDao();
      categoryRepository = CategoryRepository(mockDao);
    });

    setUpAll(() {
      registerFallbackValue(FakeTCategories());
      registerFallbackValue(TransactionType.income);
    });

    group('addCategory', () {
      test('should return Right(unit) on success', () async {
        // arrange
        when(
          () => mockDao.addCategory(
            name: any(named: 'name'),
            type: any(named: 'type'),
            parentId: any(named: 'parentId'),
            iconName: any(named: 'iconName'),
            iconColorName: any(named: 'iconColorName'),
          ),
        ).thenAnswer((_) async => dummyTCategory);

        // act
        final result = await categoryRepository.addCategory(
          name: 'New Name',
          type: TransactionType.income,
        );

        // assert
        expect(result, const Right(unit));
      });

      test('should return Left(CategoryFailure.databaseFailure()) on failure',
          () async {
        // arrange
        when(
          () => mockDao.addCategory(
            name: any(named: 'name'),
            type: any(named: 'type'),
            parentId: any(named: 'parentId'),
            iconName: any(named: 'iconName'),
            iconColorName: any(named: 'iconColorName'),
          ),
        ).thenThrow(Exception());

        // act
        final result = await categoryRepository.addCategory(
          name: 'New Name',
          type: TransactionType.income,
        );

        // assert
        expect(result, const Left(CategoryFailure.databaseFailure()));
      });
    });

    group('getCategories', () {
      test('should return Right(list of categories) on success', () async {
        // arrange
        when(() => mockDao.getCategories())
            .thenAnswer((_) async => [dummyTCategoryData]);

        // act
        final result = await categoryRepository.getCategories();
        final resultList = result.getOrElse((_) => []);

        // assert
        expect(resultList, [dummyCategory]);
      });

      test('should return Left(CategoryFailure.databaseFailure()) on failure',
          () async {
        // arrange
        when(() => mockDao.getCategories()).thenThrow(Exception());

        // act
        final result = await categoryRepository.getCategories();

        // assert
        expect(result, const Left(CategoryFailure.databaseFailure()));
      });
    });

    group('getCategory', () {
      test('should return Right(category) on success', () async {
        // arrange
        when(() => mockDao.getCategory(any()))
            .thenAnswer((_) async => dummyTCategoryData);

        // act
        final result = await categoryRepository.getCategory(1);

        // assert
        expect(result, Right(dummyCategory));
      });

      test('should return Left(CategoryFailure.databaseFailure()) on failure',
          () async {
        // arrange
        when(() => mockDao.getCategory(any())).thenThrow(Exception());

        // act
        final result = await categoryRepository.getCategory(1);

        // assert
        expect(result, const Left(CategoryFailure.databaseFailure()));
      });
    });
    group('updateCategory', () {
      test('should return Right(unit) on success', () async {
        // arrange
        when(
          () => mockDao.updateCategory(any()),
        ).thenAnswer((_) async => {});

        // act
        final result = await categoryRepository.updateCategory(
          dummyCategory,
        );

        // assert
        expect(result, const Right(unit));
      });

      test('should return Left(CategoryFailure.databaseFailure()) on failure',
          () async {
        // arrange
        when(
          () => mockDao.updateCategory(any()),
        ).thenThrow(Exception());

        // act
        final result = await categoryRepository.updateCategory(
          dummyCategory,
        );

        // assert
        expect(result, const Left(CategoryFailure.databaseFailure()));
      });
    });

    group('deleteCategory', () {
      test('should return Right(unit) on success', () async {
        // arrange
        when(
          () => mockDao.softDeleteCategory(any()),
        ).thenAnswer((_) async => {});

        // act
        final result = await categoryRepository.deleteCategory(
          dummyCategory,
        );

        // assert
        expect(result, const Right(unit));
      });

      test('should return Left(CategoryFailure.databaseFailure()) on failure',
          () async {
        // arrange
        when(
          () => mockDao.softDeleteCategory(any()),
        ).thenThrow(Exception());

        // act
        final result = await categoryRepository.deleteCategory(
          dummyCategory,
        );

        // assert
        expect(result, const Left(CategoryFailure.databaseFailure()));
      });
    });
  });
}
