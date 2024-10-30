// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:moneymanager/domain/account/i_account_repository.dart' as _i711;
import 'package:moneymanager/domain/category/i_category_repository.dart'
    as _i464;
import 'package:moneymanager/domain/transaction/transaction.dart' as _i297;
import 'package:moneymanager/infrastructure/account/account_repository.dart'
    as _i541;
import 'package:moneymanager/infrastructure/category/category_repository.dart'
    as _i748;
import 'package:moneymanager/infrastructure/core/app_database_module.dart'
    as _i701;
import 'package:moneymanager/infrastructure/core/drift/app_database.dart'
    as _i750;
import 'package:moneymanager/infrastructure/core/drift/dao/accounts_dao.dart'
    as _i622;
import 'package:moneymanager/infrastructure/core/drift/dao/categories_dao.dart'
    as _i19;
import 'package:moneymanager/infrastructure/core/drift/dao/transactions_dao.dart'
    as _i583;
import 'package:moneymanager/infrastructure/transaction/transaction_repository.dart'
    as _i393;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appDatabaseModule = _$AppDatabaseModule();
    gh.lazySingleton<_i750.AppDatabase>(() => appDatabaseModule.localDatabase);
    gh.lazySingleton<_i622.AccountsDao>(
        () => _i622.AccountsDao(gh<_i750.AppDatabase>()));
    gh.lazySingleton<_i19.CategoriesDao>(
        () => _i19.CategoriesDao(gh<_i750.AppDatabase>()));
    gh.lazySingleton<_i583.TransactionsDao>(
        () => _i583.TransactionsDao(gh<_i750.AppDatabase>()));
    gh.lazySingleton<_i464.ICategoryRepository>(
        () => _i748.CategoryRepository(gh<_i19.CategoriesDao>()));
    gh.lazySingleton<_i711.IAccountRepository>(
        () => _i541.AccountRepository(gh<_i622.AccountsDao>()));
    gh.lazySingleton<_i297.ITransactionRepository>(
        () => _i393.TransactionRepository(gh<_i583.TransactionsDao>()));
    return this;
  }
}

class _$AppDatabaseModule extends _i701.AppDatabaseModule {}
