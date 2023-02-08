import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:moneymanager/domain/core/entities/entities.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';
import 'package:moneymanager/infrastructure/core/drift/database/tables.dart';
import 'package:moneymanager/presentation/core/color_name.dart';

part 'categories_dao.g.dart';

@lazySingleton
@DriftAccessor(
  tables: [TCategories],
)
class CategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriesDaoMixin {
  CategoriesDao(super.db);

  /// Create new category
  Future<TCategory> addCategory({
    required String name,
    required TransactionType type,
    int? parentId,
    String? iconName,
    String? iconColorName,
  }) async {
    final result = await into(tCategories).insertReturning(
      TCategoriesCompanion.insert(
        name: name,
        type: type,
        categoryId: Value(parentId),
        iconName: iconName ?? ColorName.red.name,
        iconColorName: iconColorName ?? 'solid question-circle',
      ),
    );
    return result;
  }

  /// Get single category
  Future<TCategoryData?> getCategory(int id) async {
    final parentCategories = alias(tCategories, 'parent_categories');
    final query = select(tCategories).join([
      leftOuterJoin(
        parentCategories,
        tCategories.categoryId.equalsExp(parentCategories.id),
      ),
    ])
      ..where(tCategories.deletedAt.isNull())
      ..where(tCategories.id.equals(id));
    final result = await query.getSingleOrNull();
    if (result == null) return null;
    final category = result.readTable(tCategories);
    final parentCategory = result.readTableOrNull(parentCategories);
    return TCategoryData.fromTableClass(category, parentCategory);
  }

  /// Get all categories with parent category
  Future<List<TCategoryData>> getCategories({
    TransactionType? transactionType,
  }) async {
    final parentCategories = alias(tCategories, 'parent_categories');
    final query = select(tCategories).join([
      leftOuterJoin(
        parentCategories,
        tCategories.categoryId.equalsExp(parentCategories.id),
      ),
    ])
      ..where(tCategories.hidden.equals(false));
    if (transactionType != null) {
      query.where(tCategories.type.equalsValue(transactionType));
    }
    final result = await query.get();
    return result.map((row) {
      final category = row.readTable(tCategories);
      final parentCategory = row.readTableOrNull(parentCategories);
      return TCategoryData.fromTableClass(category, parentCategory);
    }).toList();
  }

  /// Update category
  Future<void> updateCategory(TCategory category) async {
    await update(tCategories).replace(
      category.copyWith(
        updatedAt: DateTime.now(),
      ),
    );
  }

  /// Soft delete category
  Future<void> softDeleteCategory(TCategory category) async {
    await update(tCategories).replace(
      category.copyWith(
        updatedAt: DateTime.now(),
        deletedAt: Value(DateTime.now()),
      ),
    );
  }
}
