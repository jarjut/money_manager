import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';
import 'package:moneymanager/infrastucture/core/drift/database/tables.dart';

part 'categories_dao.g.dart';

@lazySingleton
@DriftAccessor(
  tables: [TCategories],
)
class CategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriesDaoMixin {
  CategoriesDao(super.db);

  /// Get all categories with parent category
  Future<List<TCategoryData>> getAllCategories() async {
    final parentCategories = alias(tCategories, 'parent_categories');
    final query = select(tCategories).join([
      leftOuterJoin(
        parentCategories,
        tCategories.categoryId.equalsExp(parentCategories.id),
      ),
    ])
      ..where(tCategories.hidden.equals(false));
    final result = await query.get();
    return result.map((row) {
      final category = row.readTable(tCategories);
      final parentCategory = row.readTable(parentCategories);
      return TCategoryData.fromTableClass(category, parentCategory);
    }).toList();
  }
}
