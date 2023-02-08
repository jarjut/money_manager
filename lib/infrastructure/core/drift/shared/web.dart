// coverage:ignore-file

import 'package:drift/web.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';

/// constructDB based on the platform.
AppDatabase constructDB() {
  return AppDatabase(WebDatabase('db'));
}
