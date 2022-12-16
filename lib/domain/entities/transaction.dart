import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moneymanager/domain/entities/account.dart';
import 'package:moneymanager/domain/entities/category.dart';

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
    required Account from,
    Account? to,
    required double amount,
    String? note,
    String? description,
    required TransactionType type,
    required DateTime date,
  }) = _Transaction;
}
