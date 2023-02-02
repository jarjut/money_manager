// coverage:ignore-file

import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:moneymanager/domain/core/entities/entities.dart';
import 'package:moneymanager/infrastucture/core/drift/dao/accounts_dao.dart';
import 'package:moneymanager/infrastucture/core/drift/dao/categories_dao.dart';
import 'package:moneymanager/infrastucture/core/drift/dao/transactions_dao.dart';
import 'package:moneymanager/infrastucture/core/drift/database/tables.dart';

part 'main.g.dart';
part 'extension.dart';
part 'populate.dart';

/// {@template app_database}
/// Main Database class.
/// {@endtemplate}
@DriftDatabase(
  tables: [
    TCategories,
    TAccountGroups,
    TAccounts,
    TTransactions,
    TBudgets,
    TDataCurrencies,
  ],
  daos: [
    AccountsDao,
    CategoriesDao,
    TransactionsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// {@macro app_database}
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) => m.createAll(),
      onUpgrade: (m, from, to) async {
        // disable foreign_keys before migrations
        await customStatement('PRAGMA foreign_keys = OFF');

        await transaction(() async {
          // put your migration logic here
        });

        // Assert that the schema is valid after migrations
        if (kDebugMode) {
          final wrongForeignKeys =
              await customSelect('PRAGMA foreign_key_check').get();
          assert(
            wrongForeignKeys.isEmpty,
            '${wrongForeignKeys.map((e) => e.data)}',
          );
        }
      },
      beforeOpen: (details) async {
        if (details.wasCreated) {
          // Populate the database with initial data.
          await _populateDatabase(this);
        }
        // enable foreign_keys before open database
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}
