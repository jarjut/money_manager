import 'package:flutter/material.dart';
import 'package:moneymanager/presentation/app/theme/theme.dart';

class AppTheme {
  static ThemeData light(ColorScheme? colorScheme) => ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme ?? lightColorScheme,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
        ),
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        fontFamily: 'Poppins',
      );

  static ThemeData dark(ColorScheme? colorScheme) => ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme ?? darkColorScheme,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColorDark,
          foregroundColor: onPrimaryColorDark,
        ),
        canvasColor: canvasColorDark,
        scaffoldBackgroundColor: scaffoldBackgroundColorDark,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: bottomAppBarColorDark,
        ),
        fontFamily: 'Poppins',
      );
}
