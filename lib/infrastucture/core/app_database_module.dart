import 'package:app_database/app_database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppDatabaseModule {
  @lazySingleton
  AppDatabase get localDatabase => constructDB();
}
