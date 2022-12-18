import 'package:fpdart/fpdart.dart';
import 'package:moneymanager/domain/entities/transaction.dart';
import 'package:moneymanager/domain/transaction/transaction_failure.dart';

abstract class ITransactionRepository {
  /// Add a new transaction
  Future<Either<TransactionFailure, Unit>> addTransaction({
    required int categoryId,
    required TransactionType type,
    required int fromAccountId,
    int? toAccountId,
    required double amount,
    String? note,
    String? description,
    required DateTime date,
  });

  /// Get all transactions
  Future<Either<TransactionFailure, List<Transaction>>> getTransactions({
    DateTime? from,
    DateTime? to,
    int? categoryId,
    int? accountId,
    TransactionType? type,
  });

  /// Get single transaction
  Future<Either<TransactionFailure, Transaction>> getTransaction(int id);

  /// Update a transaction
  Future<Either<TransactionFailure, Unit>> updateTransaction(
    Transaction transaction,
  );

  /// Delete a transaction
  Future<Either<TransactionFailure, Unit>> deleteTransaction(
    Transaction transaction,
  );
}
