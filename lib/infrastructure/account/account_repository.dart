import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:moneymanager/domain/account/account_failure.dart';
import 'package:moneymanager/domain/account/i_account_repository.dart';
import 'package:moneymanager/domain/core/entities/account.dart';
import 'package:moneymanager/infrastructure/core/drift/dao/accounts_dao.dart';
import 'package:moneymanager/infrastructure/core/drift/models/models.dart';

@LazySingleton(as: IAccountRepository)
class AccountRepository implements IAccountRepository {
  AccountRepository(this._accountsDao);

  final AccountsDao _accountsDao;

  @override
  Future<Either<AccountFailure, Unit>> addAccountGroup({
    required String name,
  }) async {
    try {
      await _accountsDao.addAccountGroup(name: name);
      return const Right(unit);
    } catch (e) {
      return const Left(AccountFailure.databaseFailure());
    }
  }

  @override
  Future<Either<AccountFailure, Unit>> addAccount({
    required String name,
    required double initialBalance,
    required int accountGroupId,
  }) async {
    try {
      await _accountsDao.addAccount(
        name: name,
        initialBalance: initialBalance,
        accountGroupId: accountGroupId,
      );
      return const Right(unit);
    } catch (e) {
      return const Left(AccountFailure.databaseFailure());
    }
  }

  @override
  Future<Either<AccountFailure, Account>> getAccount(int id) async {
    try {
      final result = await _accountsDao.getAccount(id);
      if (result == null) {
        return const Left(AccountFailure.notFound());
      }
      return Right(result.toEntity());
    } catch (e) {
      return const Left(AccountFailure.databaseFailure());
    }
  }

  @override
  Future<Either<AccountFailure, List<Account>>> getAccounts() async {
    try {
      final result = await _accountsDao.getAllAccounts();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(AccountFailure.databaseFailure());
    }
  }

  @override
  Future<Either<AccountFailure, Unit>> updateAccount({
    required Account account,
    double balanceChange = 0,
  }) async {
    try {
      final tAccountData = TAccountData.fromEntity(account);
      await _accountsDao.updateAccount(
        account: tAccountData.account,
        balanceChange: balanceChange,
      );
      return const Right(unit);
    } catch (e) {
      return const Left(AccountFailure.databaseFailure());
    }
  }

  @override
  Future<Either<AccountFailure, Unit>> softDeleteAccount(
    Account account,
  ) async {
    try {
      final tAccountData = TAccountData.fromEntity(account);
      await _accountsDao.softDeleteAccount(tAccountData.account);
      return const Right(unit);
    } catch (e) {
      return const Left(AccountFailure.databaseFailure());
    }
  }
}
