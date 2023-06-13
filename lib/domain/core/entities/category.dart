import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moneymanager/domain/core/entities/entities.dart';

part 'category.freezed.dart';

@freezed
class TransactionCategory with _$TransactionCategory {
  const factory TransactionCategory({
    required int id,
    required String name,
    required TransactionType type,
    required String iconName,
    required String iconColorName,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? categoryId,
    TransactionCategory? parentCategory,
    @Default(false) bool hidden,
    DateTime? deletedAt,
  }) = _TransactionCategory;

  const TransactionCategory._();

  bool get isParent => categoryId == null;
  bool get isDeleted => deletedAt != null;
}
