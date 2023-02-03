// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:moneymanager/domain/account/i_account_repository.dart' as _i9;
import 'package:moneymanager/domain/category/i_category_repository.dart' as _i5;
import 'package:moneymanager/domain/transaction/transaction.dart' as _i11;
import 'package:moneymanager/infrastructure/account/account_repository.dart'
    as _i10;
import 'package:moneymanager/infrastructure/category/category_repository.dart'
    as _i6;
import 'package:moneymanager/infrastructure/core/app_database_module.dart'
    as _i13;
import 'package:moneymanager/infrastructure/core/drift/app_database.dart'
    as _i3;
import 'package:moneymanager/infrastructure/core/drift/dao/accounts_dao.dart'
    as _i8;
import 'package:moneymanager/infrastructure/core/drift/dao/categories_dao.dart'
    as _i4;
import 'package:moneymanager/infrastructure/core/drift/dao/transactions_dao.dart'
    as _i7;
import 'package:moneymanager/infrastructure/transaction/transaction_repository.dart'
    as _i12;

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
    gh.lazySingleton<_i5.ICategoryRepository>(
        () => _i6.CategoryRepository(gh<_i4.CategoriesDao>()));
    gh.lazySingleton<_i7.TransactionsDao>(
        () => _i7.TransactionsDao(gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i8.AccountsDao>(
        () => _i8.AccountsDao(gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i9.IAccountRepository>(
        () => _i10.AccountRepository(gh<_i8.AccountsDao>()));
    gh.lazySingleton<_i11.ITransactionRepository>(
        () => _i12.TransactionRepository(gh<_i7.TransactionsDao>()));
    return this;
  }
}

class _$AppDatabaseModule extends _i13.AppDatabaseModule {}
