import 'package:app_database/src/database/main.dart';
import 'package:drift/web.dart';

/// constructDB based on the platform.
AppDatabase constructDB() {
  return AppDatabase(WebDatabase('db'));
}
