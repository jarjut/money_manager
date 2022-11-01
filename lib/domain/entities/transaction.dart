import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_manager/domain/entities/account.dart';
import 'package:money_manager/domain/entities/category.dart';

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
    required Category category,
    required Account from,
    required Account to,
    required double amount,
    String? note,
    required TransactionType type,
    required DateTime date,
  }) = _Transaction;
}
