import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moneymanager/domain/entities/entities.dart';

part 'category.freezed.dart';

@freezed
class TransactionCategory with _$TransactionCategory {
  const factory TransactionCategory({
    required int id,
    int? categoryId,
    required String name,
    required TransactionType type,
    required String iconName,
    required String iconColorName,
    TransactionCategory? parentCategory,
  }) = _TransactionCategory;

  const TransactionCategory._();

  bool get isParent => categoryId == null;
}
