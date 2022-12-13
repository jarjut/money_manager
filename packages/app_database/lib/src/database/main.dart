import 'dart:convert';

import 'package:app_database/src/dao/transactions_dao.dart';
import 'package:app_database/src/database/tables.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart' show rootBundle;

part 'main.g.dart';

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
  daos: [TransactionsDao],
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
          await _populateDatabase();
        }
        // enable foreign_keys before open database
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> _populateDatabase() async {
    // Currencies
    final currenciesJson =
        await rootBundle.loadString('assets/currencies.json');
    final currencies = jsonDecode(currenciesJson) as Map<String, dynamic>;

    await batch((batch) {
      batch.insertAll(
        tDataCurrencies,
        currencies.entries.map((data) {
          final currency = data.value as Map<String, dynamic>;
          return TDataCurrency.fromJson(currency);
        }).toList(),
      );
    });

    // Accounts Group
    final cashGroup = await into(tAccountGroups).insertReturning(
      const TAccountGroupsCompanion(
        name: Value('Cash'),
        origin: Value(true),
      ),
    );
    await into(tAccounts).insert(
      TAccountsCompanion.insert(
        accountGroupId: cashGroup.id,
        name: 'Cash',
        currency: 'USD',
      ),
    );
    final accountGroup = await into(tAccountGroups).insertReturning(
      const TAccountGroupsCompanion(
        name: Value('Accounts'),
        origin: Value(true),
      ),
    );
    await into(tAccounts).insert(
      TAccountsCompanion.insert(
        accountGroupId: accountGroup.id,
        name: 'Accounts',
        currency: 'USD',
      ),
    );
    await into(tAccountGroups).insert(
      const TAccountGroupsCompanion(
        name: Value('Card'),
        origin: Value(true),
      ),
    );
    await into(tAccountGroups).insert(
      const TAccountGroupsCompanion(
        name: Value('Savings'),
        origin: Value(true),
      ),
    );
    await into(tAccountGroups).insert(
      const TAccountGroupsCompanion(
        name: Value('Investments'),
        origin: Value(true),
      ),
    );
  }
}
