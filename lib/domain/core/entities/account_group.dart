import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_group.freezed.dart';

@freezed
class AccountGroup with _$AccountGroup {
  const factory AccountGroup({
    required int id,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool origin,
    DateTime? deletedAt,
  }) = _AccountGroup;

  const AccountGroup._();

  bool get isDeleted => deletedAt != null;
}
