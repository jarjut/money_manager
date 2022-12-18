import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moneymanager/domain/entities/account_group.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account {
  const factory Account({
    required int id,
    required AccountGroup accountGroup,
    required String name,
    @Default(false) bool origin,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Account;

  const Account._();

  bool get isDeleted => deletedAt != null;
}
