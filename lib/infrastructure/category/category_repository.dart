import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:moneymanager/domain/category/category_failure.dart';
import 'package:moneymanager/domain/category/i_category_repository.dart';
import 'package:moneymanager/domain/core/entities/category.dart';
import 'package:moneymanager/domain/core/entities/transaction.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';
import 'package:moneymanager/infrastructure/core/drift/dao/categories_dao.dart';

@LazySingleton(as: ICategoryRepository)
class CategoryRepository implements ICategoryRepository {
  CategoryRepository(this._categoriesDao);

  final CategoriesDao _categoriesDao;

  @override
  Future<Either<CategoryFailure, Unit>> addCategory({
    required String name,
    required TransactionType type,
    int? categoryId,
    String? iconName,
    String? iconColorName,
  }) async {
    try {
      await _categoriesDao.addCategory(
        name: name,
        type: type,
        parentId: categoryId,
        iconName: iconName,
        iconColorName: iconColorName,
      );
      return const Right(unit);
    } catch (e) {
      return const Left(CategoryFailure.databaseFailure());
    }
  }

  @override
  Future<Either<CategoryFailure, List<TransactionCategory>>> getCategories({
    TransactionType? type,
  }) async {
    try {
      final result = await _categoriesDao.getCategories(transactionType: type);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(CategoryFailure.databaseFailure());
    }
  }

  @override
  Future<Either<CategoryFailure, TransactionCategory>> getCategory(
    int id,
  ) async {
    try {
      final result = await _categoriesDao.getCategory(id);
      if (result == null) {
        return const Left(CategoryFailure.notFound());
      }
      return Right(result.toEntity());
    } catch (e) {
      return const Left(CategoryFailure.databaseFailure());
    }
  }

  @override
  Future<Either<CategoryFailure, Unit>> updateCategory(
    TransactionCategory category,
  ) async {
    try {
      await _categoriesDao
          .updateCategory(TCategoryData.fromEntity(category).toTableClass());
      return const Right(unit);
    } catch (e) {
      return const Left(CategoryFailure.databaseFailure());
    }
  }

  @override
  Future<Either<CategoryFailure, Unit>> deleteCategory(
    TransactionCategory category,
  ) async {
    try {
      await _categoriesDao.softDeleteCategory(
        TCategoryData.fromEntity(category).toTableClass(),
      );
      return const Right(unit);
    } catch (e) {
      return const Left(CategoryFailure.databaseFailure());
    }
  }
}
