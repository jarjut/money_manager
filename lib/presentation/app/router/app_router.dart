import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:moneymanager/presentation/pages/accounts/accounts_page.dart';
import 'package:moneymanager/presentation/pages/dashboard/dashboard_page.dart';
import 'package:moneymanager/presentation/pages/main_page.dart';
import 'package:moneymanager/presentation/pages/more/more_page.dart';
import 'package:moneymanager/presentation/pages/statistics/statistics_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final mainNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter get router {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
          path: '/',
          redirect: (_, __) => '/main',
        ),
        ShellRoute(
          navigatorKey: mainNavigatorKey,
          builder: (context, state, child) => MainPage(child: child),
          routes: [
            GoRoute(
              path: '/main',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const DashboardPage(),
              ),
            ),
            GoRoute(
              path: '/statistics',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const StatisticsPage(),
              ),
            ),
            GoRoute(
              path: '/accounts',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const AccountsPage(),
              ),
            ),
            GoRoute(
              path: '/more',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const MorePage(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
