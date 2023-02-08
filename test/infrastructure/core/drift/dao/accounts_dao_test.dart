import 'package:flutter_test/flutter_test.dart';
import 'package:moneymanager/infrastructure/core/drift/app_database.dart';
import 'package:moneymanager/infrastructure/core/drift/dao/accounts_dao.dart';

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
      // Act
      final accountGroup = await dao.addAccountGroup(name: 'New Name');
      // Assert
      expect(accountGroup, isA<TAccountGroup>());
      expect(accountGroup.name, 'New Name');
    });

    test('addAccount should return TAccount when success', () async {
      // Arrange
      final accountGroup = await dao.addAccountGroup(name: 'New Name');
      // Act
      final account = await dao.addAccount(
        name: 'New Account',
        accountGroupId: accountGroup.id,
      );
      // Assert
      expect(account, isA<TAccount>());
      expect(account.name, 'New Account');
      expect(account.accountGroupId, accountGroup.id);
    });

    test(
        'getAccount should return TAccountData when success '
        'with positive balance', () async {
      // Arrange
      final accountGroup = await dao.addAccountGroup(name: 'New Name');
      final account = await dao.addAccount(
        name: 'New Account',
        accountGroupId: accountGroup.id,
        initialBalance: 100,
      );
      // Act
      final accountData = await dao.getAccount(account.id);
      // Assert
      expect(accountData, isA<TAccountData>());
      expect(accountData!.account.name, 'New Account');
      expect(accountData.balance, 100);
    });

    test(
        'getAccount should return TAccountData when success '
        'with negative balance', () async {
      // Arrange
      final accountGroup = await dao.addAccountGroup(name: 'New Name');
      final account = await dao.addAccount(
        name: 'New Account',
        accountGroupId: accountGroup.id,
        initialBalance: -100,
      );
      // Act
      final accountData = await dao.getAccount(account.id);
      // Assert
      expect(accountData, isA<TAccountData>());
      expect(accountData!.account.name, 'New Account');
      expect(accountData.balance, -100);
    });

    test('getAccounts should return List<TAccountData> when success', () async {
      // Arrange
      // disable populateDatabase
      await db.close();
      db = constructDbTest(populateDatabase: false);
      dao = db.accountsDao;
      // add data
      final accountGroup = await dao.addAccountGroup(name: 'New Name');
      await dao.addAccount(
        name: 'New Account',
        accountGroupId: accountGroup.id,
      );
      await dao.addAccount(
        name: 'New Account 2',
        accountGroupId: accountGroup.id,
      );
      // Act
      final accounts = await dao.getAllAccounts();
      // Assert
      expect(accounts, isA<List<TAccountData>>());
      expect(accounts.length, 2);
    });

    test(
        'updateAccount should change accountData when updated and '
        'add expense transaction if has negative balanceChange', () async {
      // Arrange
      final accountGroup = await dao.addAccountGroup(name: 'GroupName');
      final account = await dao.addAccount(
        name: 'AccountName',
        accountGroupId: accountGroup.id,
        initialBalance: 100,
      );
      // Act
      await dao.updateAccount(
        account: account.copyWith(name: 'NewName'),
        balanceChange: -50,
      );
      // Assert
      final accountData = await dao.getAccount(account.id);
      expect(accountData!.account.name, 'NewName');
      expect(accountData.balance, 50);
    });

    test(
        'updateAccount should change accountData when updated and '
        'add income transaction if has positive balanceChange', () async {
      // Arrange
      final accountGroup = await dao.addAccountGroup(name: 'GroupName');
      final account = await dao.addAccount(
        name: 'AccountName',
        accountGroupId: accountGroup.id,
        initialBalance: 100,
      );
      // Act
      await dao.updateAccount(
        account: account.copyWith(name: 'NewName'),
        balanceChange: 50,
      );
      // Assert
      final accountData = await dao.getAccount(account.id);
      expect(accountData!.account.name, 'NewName');
      expect(accountData.balance, 150);
    });

    test('softDeleteAccount should change deletedAt to not null', () async {
      // Arrange
      final accountGroup = await dao.addAccountGroup(name: 'GroupName');
      final account = await dao.addAccount(
        name: 'AccountName',
        accountGroupId: accountGroup.id,
      );
      // Act
      await dao.softDeleteAccount(account);
      // Assert
      final accountData = await dao.getAccount(account.id);
      expect(accountData, isNull);
    });
  });
}
