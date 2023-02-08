import 'package:flutter/material.dart';
import 'package:moneymanager/presentation/app/theme/theme.dart';

class AppTheme {
  static ThemeData themeData({required bool isDark, ColorScheme? colorScheme}) {
    final scheme = colorScheme ??
        (isDark ? AppColors.darkColorScheme : AppColors.lightColorScheme);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
      ),
      scaffoldBackgroundColor: scheme.background,
      fontFamily: 'Poppins',
    );
  }
}
