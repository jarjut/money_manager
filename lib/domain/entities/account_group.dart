import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_group.freezed.dart';

@freezed
class AccountGroup with _$AccountGroup {
  const factory AccountGroup({
    required int id,
    required String name,
    @Default(false) bool origin,
  }) = _AccountGroup;
}
