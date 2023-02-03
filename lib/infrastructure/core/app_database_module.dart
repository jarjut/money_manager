import 'package:injectable/injectable.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';

@module
abstract class AppDatabaseModule {
  @lazySingleton
  AppDatabase get localDatabase => constructDB();
}
