import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

enum CategoryType {
  income,
  expense,
  loanDebt,
}

@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    String? categoryId,
    required String name,
    required ContentType type,
    required String iconName,
    required String iconColorName,
    @Default([]) List<Category> children,
  }) = _Category;
}
