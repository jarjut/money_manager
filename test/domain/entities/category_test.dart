import 'package:flutter_test/flutter_test.dart';

import '../../dummy/category_dummy.dart';

void main() {
  group('Category Entity', () {
    test('isDeleted return true if deletedAt is not null', () {
      final transaction = dummyCategory.copyWith(deletedAt: DateTime.now());
      expect(transaction.isDeleted, true);
    });

    test('isParent return true if categoryId is null', () {
      final transaction = dummyCategory.copyWith(categoryId: null);
      expect(transaction.isParent, true);
    });
  });
}
