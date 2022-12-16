import 'package:fpdart/fpdart.dart';
import 'package:moneymanager/domain/core/failure.dart';
import 'package:moneymanager/domain/entities/transaction.dart';

abstract class ITransactionRepository {
  /// Get all transactions
  Future<Either<Failure, List<Transaction>>> getTransactions({
    DateTime? from,
    DateTime? to,
    int? categoryId,
    int? accountId,
    TransactionType? type,
  });

  /// Get single transaction
  Future<Either<Failure, Transaction>> getTransaction(int id);

  /// Add a new transaction
  Future<Either<Failure, Unit>> addTransaction({
    required int categoryId,
    required TransactionType type,
    required int fromAccountId,
    int? toAccountId,
    required double amount,
    String? note,
    String? description,
    required DateTime date,
  });

  /// Update a transaction
  Future<Either<Failure, Unit>> updateTransaction(Transaction transaction);

  /// Delete a transaction
  Future<Either<Failure, Unit>> deleteTransaction(Transaction transaction);
}
