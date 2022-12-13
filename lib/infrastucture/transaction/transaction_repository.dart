import 'package:app_database/app_database.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:moneymanager/domain/core/failure.dart';
import 'package:moneymanager/domain/entities/transaction.dart';
import 'package:moneymanager/domain/transaction/i_transaction_repository.dart';

@LazySingleton(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository {
  TransactionRepository(this._appDatabase);

  final AppDatabase _appDatabase;

  @override
  Future<Either<Failure, Unit>> addTransaction(Transaction transaction) {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteTransaction(Transaction transaction) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions() {
    // TODO: implement getTransactions
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateTransaction(Transaction transaction) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }
}
