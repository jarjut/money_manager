import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/presentation/pages/accounts/accounts_page.dart';
import 'package:money_manager/presentation/pages/dashboard/dashboard_page.dart';
import 'package:money_manager/presentation/pages/statistics/statistics_page.dart';
import '../../helpers/helpers.dart';

void main() {
  group('GoRouter', () {
    testWidgets('app start with dashboard page', (tester) async {
      await tester.pumpApp();
      expect(find.byType(DashboardPage), findsOneWidget);
    });

    testWidgets('check shell route show desired page', (tester) async {
      await tester.pumpApp();
      await tester.setRouteLocation('/statistics');
      expect(find.byType(StatisticsPage), findsOneWidget);
      await tester.setRouteLocation('/accounts');
      expect(find.byType(AccountsPage), findsOneWidget);
    });
  });
}
