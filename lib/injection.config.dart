// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:moneymanager/infrastucture/core/local_database/injectable_module.dart'
    as _i4;
import 'package:moneymanager/infrastucture/core/local_database/local_database.dart'
    as _i3;

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
    final localDatabaseInjectableModule = _$LocalDatabaseInjectableModule();
    gh.lazySingleton<_i3.AppDatabase>(
        () => localDatabaseInjectableModule.localDatabase);
    return this;
  }
}

class _$LocalDatabaseInjectableModule
    extends _i4.LocalDatabaseInjectableModule {}
