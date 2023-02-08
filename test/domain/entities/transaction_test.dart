import 'package:flutter_test/flutter_test.dart';

import '../../dummy/transaction_dummy.dart';

void main() {
  group('Transaction Entity', () {
    test('isDeleted return true if deletedAt is not null', () {
      final transaction = dummyTransaction.copyWith(deletedAt: DateTime.now());
      expect(transaction.isDeleted, true);
    });
  });
}
