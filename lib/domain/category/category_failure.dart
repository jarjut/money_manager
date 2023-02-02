import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_failure.freezed.dart';

@freezed
class CategoryFailure with _$CategoryFailure {
  const factory CategoryFailure.unexpected() = _Unexpected;
  const factory CategoryFailure.notFound() = _NotFound;
  const factory CategoryFailure.databaseFailure() = _DatabaseFailure;
}
