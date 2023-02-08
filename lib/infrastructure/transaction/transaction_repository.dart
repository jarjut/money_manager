import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:moneymanager/domain/core/entities/transaction.dart';
import 'package:moneymanager/domain/transaction/transaction.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';
import 'package:moneymanager/infrastructure/core/drift/dao/transactions_dao.dart';

@LazySingleton(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository {
  TransactionRepository(this._transactionsDao);

  final TransactionsDao _transactionsDao;

  /// Add Transaction to Local Database.
  ///
  /// * If [TransactionType.income], [toAccountId] is required.
  /// * If [TransactionType.expense], [fromAccountId] is required.
  /// * If [TransactionType.transfer], [fromAccountId] and
  /// [toAccountId] are required.
  ///
  /// If the transaction is not valid,
  /// it returns [TransactionFailure.invalidTransaction].
  @override
  Future<Either<TransactionFailure, Unit>> addTransaction({
    required int categoryId,
    required TransactionType type,
    int? fromAccountId,
    int? toAccountId,
    required double amount,
    String? note,
    String? description,
    required DateTime date,
  }) async {
    // Check if the transaction is valid
    if (type == TransactionType.income && toAccountId == null) {
      return const Left(TransactionFailure.invalidTransaction());
    }
    if (type == TransactionType.expense && fromAccountId == null) {
      return const Left(TransactionFailure.invalidTransaction());
    }
    if (type == TransactionType.transfer &&
        (fromAccountId == null || toAccountId == null)) {
      return const Left(TransactionFailure.invalidTransaction());
    }

    try {
      await _transactionsDao.addTransaction(
        categoryId: categoryId,
        type: type,
        fromAccountId: fromAccountId,
        toAccountId: toAccountId,
        amount: amount,
        note: note,
        description: description,
        date: date,
      );
      return const Right(unit);
    } catch (e) {
      return const Left(TransactionFailure.databaseFailure());
    }
  }

  /// Get a transaction by id
  ///
  /// If the transaction is not found, it returns [TransactionFailure.notFound].
  @override
  Future<Either<TransactionFailure, Transaction>> getTransaction(int id) async {
    try {
      final result = await _transactionsDao.getTransaction(id);
      if (result == null) {
        return const Left(TransactionFailure.notFound());
      }
      return Right(result.toEntity());
    } catch (e) {
      return const Left(TransactionFailure.databaseFailure());
    }
  }

  @override
  Future<Either<TransactionFailure, List<Transaction>>> getTransactions({
    DateTime? from,
    DateTime? to,
    int? categoryId,
    int? accountId,
    TransactionType? type,
  }) async {
    try {
      final result = await _transactionsDao.getTransactions(
        fromDate: from,
        toDate: to,
        categoryId: categoryId,
        accountId: accountId,
        type: type,
      );
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(TransactionFailure.databaseFailure());
    }
  }

  @override
  Future<Either<TransactionFailure, Unit>> updateTransaction(
    Transaction transaction,
  ) async {
    try {
      await _transactionsDao.updateTransaction(
        TTransactionData.fromEntity(transaction).transaction,
      );
      return const Right(unit);
    } catch (e) {
      return const Left(TransactionFailure.databaseFailure());
    }
  }

  @override
  Future<Either<TransactionFailure, Unit>> deleteTransaction(
    Transaction transaction,
  ) async {
    try {
      await _transactionsDao.deleteTransaction(transaction.id);
      return const Right(unit);
    } catch (e) {
      return const Left(TransactionFailure.databaseFailure());
    }
  }
}
