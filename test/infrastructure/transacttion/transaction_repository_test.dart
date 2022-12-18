// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moneymanager/domain/entities/transaction.dart';
import 'package:moneymanager/domain/transaction/transaction_failure.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';
import 'package:moneymanager/infrastucture/core/drift/dao/transactions_dao.dart';
import 'package:moneymanager/infrastucture/transaction/transaction_repository.dart';

import '../../dummy/dummy.dart';

class MockTransactionsDao extends Mock implements TransactionsDao {}

class FakeTTransaction extends Fake implements TTransaction {}

void main() {
  group('TransactionRepository', () {
    late TransactionsDao mockDao;
    late TransactionRepository transactionRepository;

    setUp(() {
      mockDao = MockTransactionsDao();
      transactionRepository = TransactionRepository(mockDao);
    });

    setUpAll(() {
      registerFallbackValue(TransactionType.expense);
      registerFallbackValue(FakeTTransaction());
    });

    group('addTransaction', () {
      test('should return Right(unit) on success', () async {
        // arrange
        when(
          () => mockDao.addTransaction(
            categoryId: any(named: 'categoryId'),
            type: any(named: 'type'),
            fromAccountId: any(named: 'fromAccountId'),
            toAccountId: any(named: 'toAccountId'),
            amount: any(named: 'amount'),
            note: any(named: 'note'),
            description: any(named: 'description'),
            date: any(named: 'date'),
          ),
        ).thenAnswer((_) async => dummyTTransaction);

        // act
        final result = await transactionRepository.addTransaction(
          categoryId: 1,
          type: TransactionType.expense,
          fromAccountId: 1,
          amount: 1000,
          date: DateTime(2022, 2, 2),
        );

        // assert
        expect(result, const Right(unit));
      });

      test('should return Left(TransactionFailure) on error', () async {
        // arrange
        when(
          () => mockDao.addTransaction(
            categoryId: any(named: 'categoryId'),
            type: any(named: 'type'),
            fromAccountId: any(named: 'fromAccountId'),
            toAccountId: any(named: 'toAccountId'),
            amount: any(named: 'amount'),
            note: any(named: 'note'),
            description: any(named: 'description'),
            date: any(named: 'date'),
          ),
        ).thenThrow((_) async => Exception);

        // act
        final result = await transactionRepository.addTransaction(
          categoryId: 1,
          type: TransactionType.expense,
          fromAccountId: 1,
          amount: 1000,
          date: DateTime(2022, 2, 2),
        );

        // assert
        expect(result, const Left(TransactionFailure.databaseFailure()));
      });
    });

    group('getTransaction', () {
      test('should return Right(Transaction) on success', () async {
        // arrange
        when(() => mockDao.getTransaction(any()))
            .thenAnswer((_) async => dummyTTransactionData);

        // act
        final result = await transactionRepository.getTransaction(1);

        // assert
        expect(result, Right(dummyTransaction));
      });
      test('should return Left(TransactionFailure) on error', () async {
        // arrange
        when(() => mockDao.getTransaction(any()))
            .thenThrow((_) async => Exception);

        // act
        final result = await transactionRepository.getTransaction(1);

        // assert
        expect(result, const Left(TransactionFailure.databaseFailure()));
      });
    });

    group('getTransactions', () {
      test('should return Right(List<Transaction>) on success', () async {
        // arrange
        when(() => mockDao.getTransactions())
            .thenAnswer((_) async => [dummyTTransactionData]);

        // act
        final result = await transactionRepository.getTransactions();

        final resultList = result.getOrElse((_) => []);

        // assert
        expect(resultList, [dummyTransaction]);
      });
      test('should return Left(TransactionFailure) on error', () async {
        // arrange
        when(() => mockDao.getTransactions()).thenThrow((_) async => Exception);

        // act
        final result = await transactionRepository.getTransactions();

        // assert
        expect(result, const Left(TransactionFailure.databaseFailure()));
      });
    });

    group('updateTransaction', () {
      test('should return Right(unit) on success', () async {
        // arrange
        when(
          () => mockDao.updateTransaction(any()),
        ).thenAnswer((_) async {});

        // act
        final result = await transactionRepository.updateTransaction(
          dummyTransaction,
        );

        // assert
        expect(result, const Right(unit));
      });

      test('should return Left(TransactionFailure) on error', () async {
        // arrange
        when(
          () => mockDao.updateTransaction(any()),
        ).thenThrow((_) async => Exception);

        // act
        final result = await transactionRepository.updateTransaction(
          dummyTransaction,
        );

        // assert
        expect(result, const Left(TransactionFailure.databaseFailure()));
      });
    });

    group('deleteTransaction', () {
      test('should return Right(unit) on success', () async {
        // arrange
        when(
          () => mockDao.deleteTransaction(any()),
        ).thenAnswer((_) async {});

        // act
        final result =
            await transactionRepository.deleteTransaction(dummyTransaction);

        // assert
        expect(result, const Right(unit));
      });

      test('should return Left(TransactionFailure) on error', () async {
        // arrange
        when(
          () => mockDao.deleteTransaction(any()),
        ).thenThrow((_) async => Exception);

        // act
        final result =
            await transactionRepository.deleteTransaction(dummyTransaction);

        // assert
        expect(result, const Left(TransactionFailure.databaseFailure()));
      });
    });
  });
}
