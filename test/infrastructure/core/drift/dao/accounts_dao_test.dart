import 'package:flutter_test/flutter_test.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';
import 'package:moneymanager/infrastucture/core/drift/dao/accounts_dao.dart';

import '../../../../helper/database.dart';

void main() {
  group('AccountsDao', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late AppDatabase db;
    late AccountsDao dao;

    setUp(() {
      db = constructDbTest();
      dao = db.accountsDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('addAccountGroup should return TAccountGroup when success', () async {
      final accountGroup = await dao.addAccountGroup(name: 'New Name');
      expect(accountGroup.name, 'New Name');
    });

    test('addAccount should return TAccount when success', () async {
      final accountGroup = await dao.addAccountGroup(name: 'New Name');
      final account = await dao.addAccount(
        name: 'New Account',
        accountGroupId: accountGroup.id,
      );
      expect(account.name, 'New Account');
      expect(account.accountGroupId, accountGroup.id);
    });
  });
}
