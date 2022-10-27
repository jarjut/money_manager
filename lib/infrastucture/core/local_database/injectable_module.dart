import 'package:injectable/injectable.dart';
import 'package:money_manager/infrastucture/core/local_database/local_database.dart';

@module
abstract class LocalDatabaseInjectableModule {
  @lazySingleton
  AppDatabase get localDatabase => constructDB();
}
