import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart' show rootBundle;

part 'main.g.dart';
part 'tables.dart';
part '../converter/color_converter.dart';

@DriftDatabase(
  tables: [
    Categories,
    AccountGroups,
    Accounts,
    Transactions,
    Budgets,
    DataCurrencies,
  ],
  daos: [],
)
class AppDatabase extends _$AppDatabase {
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
          await populateDatabase();
        }
        // enable foreign_keys before open database
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> populateDatabase() async {
    // Currencies
    final currenciesJson =
        await rootBundle.loadString('assets/currencies.json');
    final currencies = jsonDecode(currenciesJson) as Map<String, dynamic>;

    await batch((batch) {
      batch.insertAll(
        dataCurrencies,
        currencies.entries.map((data) {
          final currency = data.value as Map<String, dynamic>;
          return DataCurrency.fromJson(currency);
        }).toList(),
      );
    });

    // Accounts Group
    final cashGroup = await into(accountGroups).insertReturning(
      const AccountGroupsCompanion(
        name: Value('Cash'),
        origin: Value(true),
      ),
    );
    await into(accounts).insert(
      AccountsCompanion.insert(
        accountGroupId: cashGroup.id,
        name: 'Cash',
        currency: 'USD',
      ),
    );
    final accountGroup = await into(accountGroups).insertReturning(
      const AccountGroupsCompanion(
        name: Value('Accounts'),
        origin: Value(true),
      ),
    );
    await into(accounts).insert(
      AccountsCompanion.insert(
        accountGroupId: accountGroup.id,
        name: 'Accounts',
        currency: 'USD',
      ),
    );
    await into(accountGroups).insert(
      const AccountGroupsCompanion(
        name: Value('Card'),
        origin: Value(true),
      ),
    );
    await into(accountGroups).insert(
      const AccountGroupsCompanion(
        name: Value('Savings'),
        origin: Value(true),
      ),
    );
    await into(accountGroups).insert(
      const AccountGroupsCompanion(
        name: Value('Investments'),
        origin: Value(true),
      ),
    );
  }
}
