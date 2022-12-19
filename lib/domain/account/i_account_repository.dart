import 'package:fpdart/fpdart.dart';
import 'package:moneymanager/domain/account/account_failure.dart';
import 'package:moneymanager/domain/core/entities/entities.dart';

abstract class IAccountRepository {
  /// Add new account group
  Future<Either<AccountFailure, Unit>> addAccountGroup({required String name});

  /// Add new account
  Future<Either<AccountFailure, Unit>> addAccount({
    required String name,
    required double initialBalance,
    required int accountGroupId,
  });

  /// Get all accounts
  Future<Either<AccountFailure, List<Account>>> getAccounts();

  /// Get single account
  Future<Either<AccountFailure, Account>> getAccount(int id);

  /// Update an account
  Future<Either<AccountFailure, Unit>> updateAccount(Account account);

  /// Delete an account
  Future<Either<AccountFailure, Unit>> deleteAccount(Account account);
}
