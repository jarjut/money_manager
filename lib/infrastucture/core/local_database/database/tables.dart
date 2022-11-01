// ignore_for_file: strict_raw_type

part of 'main.dart';

enum TransactionType {
  expense,
  income,
  transfer,
}

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer()
      .nullable()
      .references(Categories, #id, onDelete: KeyAction.setNull)();
  TextColumn get name => text()();
  TextColumn get iconName => text()();
  IntColumn get iconColor => integer()
      .map(const ColorConverter())
      .withDefault(const Constant(0xFF42a5f5))();
  IntColumn get type => intEnum<TransactionType>()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class AccountGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get origin => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get accountGroupId => integer().references(AccountGroups, #id)();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get currency => text()();
  TextColumn get icon => text().nullable()();
  BoolColumn get origin => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer()();
  IntColumn get type => intEnum<TransactionType>()();
  IntColumn get from => integer()(); // Accounts.id
  IntColumn get to => integer().nullable()(); // Accounts.id
  IntColumn get amount => integer()();
  TextColumn get note => text().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Budgets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer()();
  IntColumn get amount => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

// App Database

@DataClassName('DataCurrency')
class DataCurrencies extends Table {
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
