import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_failure.freezed.dart';

@freezed
class AccountFailure with _$AccountFailure {
  const factory AccountFailure.unexpected() = _Unexpected;
  const factory AccountFailure.notFound() = _NotFound;
  const factory AccountFailure.databaseFailure() = _DatabaseFailure;
}
