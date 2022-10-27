import 'package:drift/web.dart';
import 'package:money_manager/infrastucture/core/local_database/database/main.dart';

AppDatabase constructDB() {
  return AppDatabase(WebDatabase('db'));
}
