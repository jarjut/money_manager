import 'package:injectable/injectable.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';

@module
abstract class AppDatabaseModule {
  @lazySingleton
  AppDatabase get localDatabase => constructDB();
}
