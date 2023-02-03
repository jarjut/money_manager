part of 'main.dart';

// ====== Constants ======
const int categoryModBalanceIncomeId = 1;
const int categoryModBalanceExpenseId = 2;
const int categoryTransferId = 3;
const int categoryOtherIncomeId = 4;
const int categoryOtherExpenseId = 5;

// ====== Populate Database ======
Future<void> _populateDatabase(AppDatabase db) async {
  // Currencies
  final currenciesJson = await rootBundle.loadString('assets/currencies.json');
  final currencies = jsonDecode(currenciesJson) as Map<String, dynamic>;

  await db.batch((batch) {
    batch.insertAll(
      db.tDataCurrencies,
      currencies.entries.map((data) {
        final currency = data.value as Map<String, dynamic>;
        return TDataCurrency.fromJson(currency);
      }).toList(),
    );
  });

  // Accounts Group
  await db.batch((batch) {
    batch.insertAll(
      db.tAccountGroups,
      [
        const TAccountGroupsCompanion(
          id: Value(1),
          name: Value('Cash'),
          origin: Value(true),
        ),
        const TAccountGroupsCompanion(
          id: Value(2),
          name: Value('Accounts'),
          origin: Value(true),
        )
      ],
    );
  });

  // Accounts
  await db.batch((batch) {
    batch.insertAll(
      db.tAccounts,
      [
        const TAccountsCompanion(
          id: Value(1),
          accountGroupId: Value(1),
          name: Value('Cash'),
          origin: Value(true),
        ),
        const TAccountsCompanion(
          id: Value(2),
          accountGroupId: Value(2),
          name: Value('Accounts'),
          origin: Value(true),
        ),
      ],
    );
  });

  // Categories
  await db.batch((batch) {
    batch.insertAll(db.tCategories, [
      // ====== Hidden categories ======
      TCategoriesCompanion.insert(
        id: const Value(categoryModBalanceIncomeId), // 1
        name: 'Modified Balance',
        iconName: 'solid cash-register',
        iconColorName: 'Deep orange',
        type: TransactionType.income,
        hidden: const Value(true),
      ),
      TCategoriesCompanion.insert(
        id: const Value(categoryModBalanceExpenseId), // 2
        name: 'Modified Balance',
        iconName: 'solid cash-register',
        iconColorName: 'Deep orange',
        type: TransactionType.expense,
        hidden: const Value(true),
      ),
      TCategoriesCompanion.insert(
        id: const Value(categoryTransferId), // 3
        name: 'Transfer',
        iconName: 'solid money-bill-transfer',
        iconColorName: 'Deep orange',
        type: TransactionType.income,
        hidden: const Value(true),
      ),
      TCategoriesCompanion.insert(
        id: const Value(categoryOtherIncomeId), // 4
        name: 'Other',
        iconName: 'solid question-circle',
        iconColorName: 'Deep orange',
        type: TransactionType.income,
        hidden: const Value(true),
      ),
      TCategoriesCompanion.insert(
        id: const Value(categoryOtherExpenseId), // 5
        name: 'Other',
        iconName: 'solid question-circle',
        iconColorName: 'Deep orange',
        type: TransactionType.expense,
        hidden: const Value(true),
      ),

      // ====== Income categories ======
      TCategoriesCompanion.insert(
        name: 'Salary',
        iconName: 'solid money-check-dollar',
        iconColorName: 'Green',
        type: TransactionType.income,
      ),
      TCategoriesCompanion.insert(
        name: 'Bonus',
        iconName: 'solid sack-dollar',
        iconColorName: 'Green',
        type: TransactionType.income,
      ),
      TCategoriesCompanion.insert(
        name: 'Allowance',
        iconName: 'solid hand-holding-dollar',
        iconColorName: 'Green',
        type: TransactionType.income,
      ),
      TCategoriesCompanion.insert(
        name: 'Gift',
        iconName: 'solid gift',
        iconColorName: 'Green',
        type: TransactionType.income,
      ),

      // ====== Expense categories ======
      TCategoriesCompanion.insert(
        name: 'Food',
        iconName: 'solid utensils',
        iconColorName: 'Red',
        type: TransactionType.expense,
      ),
      TCategoriesCompanion.insert(
        name: 'Transportation',
        iconName: 'solid car',
        iconColorName: 'Red',
        type: TransactionType.expense,
      ),
      TCategoriesCompanion.insert(
        name: 'Entertainment',
        iconName: 'solid gamepad',
        iconColorName: 'Red',
        type: TransactionType.expense,
      ),
      TCategoriesCompanion.insert(
        name: 'Shopping',
        iconName: 'solid cart-shopping',
        iconColorName: 'Red',
        type: TransactionType.expense,
      ),
      TCategoriesCompanion.insert(
        name: 'Health',
        iconName: 'solid kit-medical',
        iconColorName: 'Red',
        type: TransactionType.expense,
      ),
      TCategoriesCompanion.insert(
        name: 'Education',
        iconName: 'solid book',
        iconColorName: 'Red',
        type: TransactionType.expense,
      ),
      TCategoriesCompanion.insert(
        name: 'Bills',
        iconName: 'solid file-invoice-dollar',
        iconColorName: 'Red',
        type: TransactionType.expense,
      ),
      TCategoriesCompanion.insert(
        name: 'Gift',
        iconName: 'solid gift',
        iconColorName: 'Red',
        type: TransactionType.expense,
      ),
      TCategoriesCompanion.insert(
        name: 'Investment',
        iconName: 'solid chart-line',
        iconColorName: 'Red',
        type: TransactionType.expense,
      ),
    ]);
  });
}
