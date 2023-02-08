import 'package:flutter_test/flutter_test.dart';

import '../../dummy/account_dummy.dart';

void main() {
  group('AccountGroup Entity', () {
    test('isDeleted return true if deletedAt is not null', () {
      final accountGroup =
          dummyAccountGroup.copyWith(deletedAt: DateTime.now());
      expect(accountGroup.isDeleted, true);
    });
  });
}
