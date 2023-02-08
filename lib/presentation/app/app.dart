import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:moneymanager/presentation/app/router/app_router.dart';
import 'package:moneymanager/presentation/app/theme/theme.dart';
import 'package:moneymanager/presentation/l10n/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter.router;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp.router(
          theme: AppTheme.themeData(
            isDark: false,
            colorScheme: lightColorScheme,
          ),
          darkTheme: AppTheme.themeData(
            isDark: true,
            colorScheme: darkColorScheme,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: _router,
        );
      },
    );
  }
}
