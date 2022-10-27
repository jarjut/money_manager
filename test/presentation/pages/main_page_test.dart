import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/presentation/pages/accounts/accounts_page.dart';
import 'package:money_manager/presentation/pages/dashboard/dashboard_page.dart';
import 'package:money_manager/presentation/pages/more/more_page.dart';
import 'package:money_manager/presentation/pages/statistics/statistics_page.dart';

import '../../helpers/helpers.dart';

void main() {
  group('MainPage', () {
    testWidgets('check navbar on tap go to desired page', (tester) async {
      await tester.pumpApp();
      await tester.tap(find.byKey(const Key('nav_main')));
      await tester.pumpAndSettle();
      expect(find.byType(DashboardPage), findsOneWidget);
      await tester.tap(find.byKey(const Key('nav_statistics')));
      await tester.pumpAndSettle();
      expect(find.byType(StatisticsPage), findsOneWidget);
      await tester.tap(find.byKey(const Key('nav_accounts')));
      await tester.pumpAndSettle();
      expect(find.byType(AccountsPage), findsOneWidget);
      await tester.tap(find.byKey(const Key('nav_more')));
      await tester.pumpAndSettle();
      expect(find.byType(MorePage), findsOneWidget);
    });
  });
}
