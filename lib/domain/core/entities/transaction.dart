import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moneymanager/domain/core/entities/account.dart';
import 'package:moneymanager/domain/core/entities/category.dart';

part 'transaction.freezed.dart';

enum TransactionType {
  income,
  expense,
  transfer,
}

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required TransactionCategory category,
    Account? from,
    Account? to,
    required double amount,
    String? note,
    String? description,
    required TransactionType type,
    required DateTime date,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Transaction;

  const Transaction._();

  bool get isDeleted => deletedAt != null;
}
