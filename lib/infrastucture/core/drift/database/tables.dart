// coverage:ignore-file
// ignore_for_file: strict_raw_type, public_member_api_docs

import 'package:drift/drift.dart';
import 'package:flutter/painting.dart';
import 'package:moneymanager/domain/entities/transaction.dart';

part 'converter.dart';

@DataClassName('TCategory')
class TCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer()
      .nullable()
      .references(TCategories, #id, onDelete: KeyAction.setNull)();
  TextColumn get name => text()();
  TextColumn get iconName => text()();
  TextColumn get iconColorName => text()();
  IntColumn get type => intEnum<TransactionType>()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class TAccountGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get origin => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class TAccounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get accountGroupId => integer().references(TAccountGroups, #id)();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get currency => text()();
  TextColumn get icon => text().nullable()();
  BoolColumn get origin => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class TTransactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer()();
  IntColumn get type => intEnum<TransactionType>()();
  IntColumn get from => integer()(); // Accounts.id
  IntColumn get to => integer().nullable()(); // Accounts.id
  RealColumn get amount => real()();
  TextColumn get note => text().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class TBudgets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer()();
  IntColumn get amount => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

// App Database

@DataClassName('TDataCurrency')
class TDataCurrencies extends Table {
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get symbol => text()();
  @JsonKey('symbol_native')
  TextColumn get symbolNative => text()();
  @JsonKey('decimal_digits')
  IntColumn get decimalDigits => integer()();
  RealColumn get rounding => real()();

  @override
  Set<Column>? get primaryKey => {code};
}
