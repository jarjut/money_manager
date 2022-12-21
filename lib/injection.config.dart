// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:moneymanager/domain/account/i_account_repository.dart' as _i7;
import 'package:moneymanager/domain/transaction/transaction.dart' as _i9;
import 'package:moneymanager/infrastucture/account/account_repository.dart'
    as _i8;
import 'package:moneymanager/infrastucture/core/app_database_module.dart'
    as _i11;
import 'package:moneymanager/infrastucture/core/drift/app_database.dart' as _i3;
import 'package:moneymanager/infrastucture/core/drift/dao/accounts_dao.dart'
    as _i6;
import 'package:moneymanager/infrastucture/core/drift/dao/categories_dao.dart'
    as _i4;
import 'package:moneymanager/infrastucture/core/drift/dao/transactions_dao.dart'
    as _i5;
import 'package:moneymanager/infrastucture/transaction/transaction_repository.dart'
    as _i10;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appDatabaseModule = _$AppDatabaseModule();
    gh.lazySingleton<_i3.AppDatabase>(() => appDatabaseModule.localDatabase);
    gh.lazySingleton<_i4.CategoriesDao>(
        () => _i4.CategoriesDao(gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i5.TransactionsDao>(
        () => _i5.TransactionsDao(gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i6.AccountsDao>(
        () => _i6.AccountsDao(gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i7.IAccountRepository>(
        () => _i8.AccountRepository(gh<_i6.AccountsDao>()));
    gh.lazySingleton<_i9.ITransactionRepository>(
        () => _i10.TransactionRepository(gh<_i5.TransactionsDao>()));
    return this;
  }
}

class _$AppDatabaseModule extends _i11.AppDatabaseModule {}
