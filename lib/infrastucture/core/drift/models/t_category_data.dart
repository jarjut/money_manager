import 'package:moneymanager/domain/core/entities/entities.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';

class TCategoryData {
  const TCategoryData({
    required this.id,
    this.categoryId,
    required this.name,
    required this.iconName,
    required this.iconColorName,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    this.parentCategory,
    this.deletedAt,
  });

  final int id;
  final int? categoryId;
  final String name;
  final String iconName;
  final String iconColorName;
  final TransactionType type;
  final TCategoryData? parentCategory;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  factory TCategoryData.fromTableClass(
    TCategory category, [
    TCategory? parentCategory,
  ]) {
    return TCategoryData(
      id: category.id,
      categoryId: category.categoryId,
      name: category.name,
      iconName: category.iconName,
      iconColorName: category.iconColorName,
      type: category.type,
      createdAt: category.createdAt,
      updatedAt: category.updatedAt,
      deletedAt: category.deletedAt,
      parentCategory: parentCategory != null
          ? TCategoryData.fromTableClass(parentCategory)
          : null,
    );
  }

  factory TCategoryData.fromEntity(TransactionCategory entity) {
    return TCategoryData(
      id: entity.id,
      parentCategory: entity.parentCategory != null
          ? TCategoryData.fromEntity(entity.parentCategory!)
          : null,
      categoryId: entity.categoryId,
      name: entity.name,
      iconName: entity.iconName,
      iconColorName: entity.iconColorName,
      type: entity.type,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
    );
  }

  TransactionCategory toEntity() {
    return TransactionCategory(
      id: id,
      categoryId: categoryId,
      name: name,
      iconColorName: iconColorName,
      iconName: iconName,
      type: type,
      parentCategory: parentCategory?.toEntity(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}
