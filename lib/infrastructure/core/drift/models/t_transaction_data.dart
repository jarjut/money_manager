import 'package:moneymanager/domain/core/entities/entities.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';

class TTransactionData {
  TTransactionData({
    required this.transaction,
    required this.category,
    this.from,
    this.to,
  });

  final TTransaction transaction;
  final TCategoryData category;
  final TAccountData? from;
  final TAccountData? to;

  factory TTransactionData.fromEntity(Transaction entity) {
    return TTransactionData(
      transaction: TTransaction(
        id: entity.id,
        categoryId: entity.category.id,
        type: entity.type,
        from: entity.from?.id,
        to: entity.to?.id,
        amount: entity.amount,
        note: entity.note,
        description: entity.description,
        date: entity.date,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        deletedAt: entity.deletedAt,
      ),
      category: TCategoryData.fromEntity(entity.category),
      from: entity.from != null ? TAccountData.fromEntity(entity.from!) : null,
      to: entity.to != null ? TAccountData.fromEntity(entity.to!) : null,
    );
  }

  Transaction toEntity() {
    return Transaction(
      id: transaction.id,
      category: category.toEntity(),
      from: from?.toEntity(),
      to: to?.toEntity(),
      amount: transaction.amount,
      note: transaction.note,
      description: transaction.description,
      type: transaction.type,
      date: transaction.date,
      createdAt: transaction.createdAt,
      updatedAt: transaction.updatedAt,
      deletedAt: transaction.deletedAt,
    );
  }
}
