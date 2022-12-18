part of 'main.dart';

extension XTCategory on TCategory {
  TransactionCategory toEntity() {
    return TransactionCategory(
      id: id,
      name: name,
      iconName: iconName,
      iconColorName: iconColorName,
      type: type,
      categoryId: categoryId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}
