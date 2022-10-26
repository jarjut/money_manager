import 'package:flutter/material.dart';

// Colors
// Light
const Color primaryColor = Color(0xFF006D77);
const Color onPrimaryColor = Color(0xFFFFFFFF);
const Color primaryContainerColor = Color(0xFF005E66);
const Color onPrimaryContainerColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color(0xFF08A045);
const Color onSecondaryColor = Color(0xFFFFFFFF);
const Color errorColor = Color(0xFFC41C30);
const Color onErrorColor = Color(0xFFFFFFFF);
const Color backgroundColor = Color(0xFFFFFFFF);
const Color onBackgroundColor = Color(0xFF000000);
const Color surfaceColor = Color(0xFFFFFFFF);
const Color onSurfaceColor = Color(0xFF000000);
const Color canvasColor = Color(0xFFFAFAFA);
const Color scaffoldBackgroundColor = canvasColor;
const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: onPrimaryColor,
  primaryContainer: primaryContainerColor,
  onPrimaryContainer: onPrimaryContainerColor,
  secondary: secondaryColor,
  onSecondary: onSecondaryColor,
  error: errorColor,
  onError: onErrorColor,
  background: backgroundColor,
  onBackground: onBackgroundColor,
  surface: surfaceColor,
  onSurface: onSurfaceColor,
);

// Dark
const Color primaryColorDark = Color(0xFF008996);
const Color onPrimaryColorDark = onPrimaryColor;
const Color primaryContainerColorDark = Color(0xFF019AA8);
const Color onPrimaryContainerColorDark = onPrimaryContainerColor;
const Color secondaryColorDark = secondaryColor;
const Color onSecondaryColorDark = onSecondaryColor;
const Color errorColorDark = errorColor;
const Color onErrorColorDark = onErrorColor;
const Color backgroundColorDark = Color(0xFF000000);
const Color onBackgroundColorDark = Color(0xFFFFFFFF);
const Color surfaceColorDark = Color(0xFF000000);
const Color onSurfaceColorDark = Color(0xFFFFFFFF);
const Color canvasColorDark = Color(0xFF1B1B1B);
const Color scaffoldBackgroundColorDark = canvasColorDark;
const Color bottomAppBarColorDark = Color(0xFF0C0C0C);
const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primaryColorDark,
  onPrimary: onPrimaryColorDark,
  primaryContainer: primaryContainerColorDark,
  onPrimaryContainer: onPrimaryContainerColorDark,
  secondary: secondaryColorDark,
  onSecondary: onSecondaryColorDark,
  error: errorColorDark,
  onError: onErrorColorDark,
  background: backgroundColorDark,
  onBackground: onBackgroundColorDark,
  surface: surfaceColorDark,
  onSurface: onSurfaceColorDark,
);

// Measurements
const double horizontalScreenPadding = 20;
