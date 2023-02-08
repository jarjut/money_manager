import 'package:drift/native.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';

AppDatabase constructDbTest({bool populateDatabase = true}) =>
    AppDatabase(NativeDatabase.memory(), populateDatabase: populateDatabase);
