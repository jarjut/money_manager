import 'package:fpdart/fpdart.dart';
import 'package:moneymanager/domain/core/entities/transaction.dart';
import 'package:moneymanager/domain/transaction/transaction_failure.dart';

abstract class ITransactionRepository {
  /// Add a new transaction
  ///
  /// * If [TransactionType.income], [toAccountId] is required.
  /// * If [TransactionType.expense], [fromAccountId] is required.
  /// * If [TransactionType.transfer], [fromAccountId] and
  /// [toAccountId] are required.
  Future<Either<TransactionFailure, Unit>> addTransaction({
    required int categoryId,
    required TransactionType type,
    int? fromAccountId,
    int? toAccountId,
    required double amount,
    String? note,
    String? description,
    required DateTime date,
  });

  /// Get all transactions
  ///
  /// can be filtered by [from], [to], [categoryId], [accountId], [type]
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
