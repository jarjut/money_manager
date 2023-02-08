import 'package:flutter_test/flutter_test.dart';

import '../../dummy/dummy.dart';

void main() {
  group('Account Entity', () {
    test('isDeleted return true if deletedAt is not null', () {
      final account = dummyAccount.copyWith(deletedAt: DateTime.now());
      expect(account.isDeleted, true);
    });
  });
}
