import 'package:drift/native.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';

AppDatabase constructDbTest() => AppDatabase(NativeDatabase.memory());
