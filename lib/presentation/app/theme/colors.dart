import 'package:flutter/material.dart';

// Colors
class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xFF006D77);
  static const Color secondaryColor = Color(0xFF08A045);

  static ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
  );

  static ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
  );
}
