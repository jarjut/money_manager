import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:moneymanager/domain/core/failure.dart';
import 'package:moneymanager/domain/entities/transaction.dart';
import 'package:moneymanager/domain/transaction/i_transaction_repository.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';
import 'package:moneymanager/infrastucture/core/drift/dao/transactions_dao.dart';

@LazySingleton(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository {
  TransactionRepository(AppDatabase appDatabase)
      : _transactionsDao = appDatabase.transactionsDao;

  final TransactionsDao _transactionsDao;

  @override
  Future<Either<Failure, Unit>> addTransaction({
    required int categoryId,
    required TransactionType type,
    required int fromAccountId,
    int? toAccountId,
    required double amount,
    String? note,
    String? description,
    required DateTime date,
  }) async {
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
      return const Left(Failure.databaseFailure());
    }
  }

  @override
  Future<Either<Failure, Transaction>> getTransaction(int id) async {
    try {
      final result = await _transactionsDao.getTransaction(id);
      if (result == null) {
        return const Left(Failure.databaseFailure());
      }
      return Right(result.toEntity());
    } catch (e) {
      return const Left(Failure.databaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions({
    DateTime? from,
    DateTime? to,
    int? categoryId,
    int? accountId,
    TransactionType? type,
  }) {
    // TODO: implement getTransactions
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateTransaction(Transaction transaction) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteTransaction(Transaction transaction) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }
}
