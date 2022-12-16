import 'package:moneymanager/domain/entities/entities.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';
import 'package:moneymanager/infrastucture/core/drift/models/t_account_data.dart';

class TTransactionData {
  TTransactionData({
    required this.transaction,
    required this.category,
    required this.from,
    this.to,
  });

  final TTransaction transaction;
  final TCategoryData category;
  final TAccountData from;
  final TAccountData? to;

  Transaction toEntity() {
    return Transaction(
      id: transaction.id,
      category: category.toEntity(),
      from: from.toEntity(),
      to: to?.toEntity(),
      amount: transaction.amount,
      note: transaction.note,
      description: transaction.description,
      type: transaction.type,
      date: transaction.date,
    );
  }
}
