import 'package:drift/native.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';

AppDatabase constructDbTest() => AppDatabase(NativeDatabase.memory());
