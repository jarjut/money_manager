import 'package:fpdart/fpdart.dart';
import 'package:moneymanager/domain/core/failure.dart';
import 'package:moneymanager/domain/entities/transaction.dart';

abstract class ITransactionRepository {
  Future<Either<Failure, List<Transaction>>> getTransactions();
  Future<Either<Failure, Unit>> addTransaction(Transaction transaction);
  Future<Either<Failure, Unit>> updateTransaction(Transaction transaction);
  Future<Either<Failure, Unit>> deleteTransaction(Transaction transaction);
}
