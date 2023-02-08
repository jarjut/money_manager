import 'package:fpdart/fpdart.dart';
import 'package:moneymanager/domain/category/category_failure.dart';
import 'package:moneymanager/domain/core/entities/entities.dart';

abstract class ICategoryRepository {
  /// Add a new category
  Future<Either<CategoryFailure, Unit>> addCategory({
    required String name,
    required TransactionType type,
    int? categoryId,
    String? iconName,
    String? iconColorName,
  });

  /// Get all categories
  ///
  /// can be filtered by [type]
  Future<Either<CategoryFailure, List<TransactionCategory>>> getCategories({
    TransactionType? type,
  });

  /// Get single category
  Future<Either<CategoryFailure, TransactionCategory>> getCategory(int id);

  /// Update a category
  Future<Either<CategoryFailure, Unit>> updateCategory(
    TransactionCategory category,
  );

  /// Delete a category
  Future<Either<CategoryFailure, Unit>> deleteCategory(
    TransactionCategory category,
  );
}
