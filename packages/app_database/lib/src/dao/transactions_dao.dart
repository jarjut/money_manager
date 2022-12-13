import 'package:app_database/src/app_database.dart';
import 'package:drift/drift.dart';

part 'transactions_dao.g.dart';

/// {@template transactions_dao}
/// Data Access Object for Transactions.
/// {@endtemplate}
@DriftAccessor(
  tables: [],
)
class TransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionsDaoMixin {
  /// {@macro transactions_dao}
  TransactionsDao(super.db);
}
