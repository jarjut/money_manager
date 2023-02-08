// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moneymanager/domain/account/account_failure.dart';
import 'package:moneymanager/infrastructure/account/account_repository.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';
import 'package:moneymanager/infrastructure/core/drift/dao/accounts_dao.dart';

import '../../dummy/account_dummy.dart';

class MockAccountsDao extends Mock implements AccountsDao {}

class FakeTAccount extends Fake implements TAccount {}

void main() {
  group('AccountRepository', () {
    late AccountsDao mockDao;
    late AccountRepository accountRepository;

    setUp(() {
      mockDao = MockAccountsDao();
      accountRepository = AccountRepository(mockDao);
    });

    setUpAll(() {
      registerFallbackValue(FakeTAccount());
    });

    group('addAccountGroup', () {
      test('should return Right(unit) on success', () async {
        // arrange
        when(() => mockDao.addAccountGroup(name: any(named: 'name')))
            .thenAnswer((_) async => dummyTAccountGroup);

        // act
        final result =
            await accountRepository.addAccountGroup(name: 'New Name');

        // assert
        expect(result, const Right(unit));
      });

      test('should return Left(AccountFailure.databaseFailure()) on failure',
          () async {
        // arrange
        when(() => mockDao.addAccountGroup(name: any(named: 'name')))
            .thenThrow(Exception());

        // act
        final result =
            await accountRepository.addAccountGroup(name: 'New Name');

        // assert
        expect(result, const Left(AccountFailure.databaseFailure()));
      });
    });

    group('addAccount', () {
      test('should return Right(unit) on success', () async {
        // arrange
        when(
          () => mockDao.addAccount(
            name: any(named: 'name'),
            accountGroupId: any(named: 'accountGroupId'),
            initialBalance: any(named: 'initialBalance'),
          ),
        ).thenAnswer((_) async => dummyTAccount);

        // act
        final result = await accountRepository.addAccount(
          name: 'New Name',
          accountGroupId: 1,
          initialBalance: 1000,
        );

        // assert
        expect(result, const Right(unit));
      });

      test('should return Left(AccountFailure.databaseFailure()) on failure',
          () async {
        // arrange
        when(
          () => mockDao.addAccount(
            name: any(named: 'name'),
            accountGroupId: any(named: 'accountGroupId'),
            initialBalance: any(named: 'initialBalance'),
          ),
        ).thenThrow(Exception());

        // act
        final result = await accountRepository.addAccount(
          name: 'New Name',
          accountGroupId: 1,
          initialBalance: 1000,
        );

        // assert
        expect(result, const Left(AccountFailure.databaseFailure()));
      });
    });

    group('getAccount', () {
      test('should return Right(account) on success', () async {
        // arrange
        when(() => mockDao.getAccount(any()))
            .thenAnswer((_) async => dummyTAccountData);

        // act
        final result = await accountRepository.getAccount(1);

        // assert
        expect(result, Right(dummyAccount));
      });

      test('should return Left(AccountFailure.databaseFailure()) on failure',
          () async {
        // arrange
        when(() => mockDao.getAccount(any())).thenThrow(Exception());

        // act
        final result = await accountRepository.getAccount(1);

        // assert
        expect(result, const Left(AccountFailure.databaseFailure()));
      });
    });

    group('getAccounts', () {
      test('should return Right(List<Account>) on success', () async {
        // arrange
        when(() => mockDao.getAllAccounts())
            .thenAnswer((_) async => [dummyTAccountData]);

        // act
        final result = await accountRepository.getAccounts();
        final resultList = result.getOrElse((_) => []);

        // assert
        expect(resultList, [dummyAccount]);
      });

      test('should return Left(AccountFailure.databaseFailure()) on failure',
          () async {
        // arrange
        when(() => mockDao.getAllAccounts()).thenThrow(Exception());

        // act
        final result = await accountRepository.getAccounts();

        // assert
        expect(result, const Left(AccountFailure.databaseFailure()));
      });
    });

    group('updateAccount', () {
      test('should return Right(unit) on success', () async {
        // arrange
        when(
          () => mockDao.updateAccount(account: any(named: 'account')),
        ).thenAnswer((_) async => {});

        // act
        final result =
            await accountRepository.updateAccount(account: dummyAccount);

        // assert
        expect(result, const Right(unit));
      });

      test('should return Left(AccountFailure.databaseFailure()) on failure',
          () async {
        // arrange
        when(
          () => mockDao.updateAccount(account: any(named: 'account')),
        ).thenThrow(Exception());

        // act
        final result =
            await accountRepository.updateAccount(account: dummyAccount);

        // assert
        expect(result, const Left(AccountFailure.databaseFailure()));
      });
    });

    group('softDeleteAccount', () {
      test('should return Right(unit) on success', () async {
        // arrange
        when(
          () => mockDao.softDeleteAccount(any()),
        ).thenAnswer((_) async => {});

        // act
        final result = await accountRepository.softDeleteAccount(dummyAccount);

        // assert
        expect(result, const Right(unit));
      });

      test('should return Left(AccountFailure.databaseFailure()) on failure',
          () async {
        // arrange
        when(
          () => mockDao.softDeleteAccount(any()),
        ).thenThrow(Exception());

        // act
        final result = await accountRepository.softDeleteAccount(dummyAccount);

        // assert
        expect(result, const Left(AccountFailure.databaseFailure()));
      });
    });
  });
}
