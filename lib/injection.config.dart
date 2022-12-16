// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:moneymanager/domain/transaction/i_transaction_repository.dart'
    as _i4;
import 'package:moneymanager/infrastucture/core/app_database_module.dart'
    as _i6;
import 'package:moneymanager/infrastucture/core/drift/app_database.dart' as _i3;
import 'package:moneymanager/infrastucture/transaction/transaction_repository.dart'
    as _i5;

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
    gh.lazySingleton<_i4.ITransactionRepository>(
        () => _i5.TransactionRepository(gh<_i3.AppDatabase>()));
    return this;
  }
}

class _$AppDatabaseModule extends _i6.AppDatabaseModule {}
