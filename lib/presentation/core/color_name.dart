// coverage:ignore-file
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

// Color Names
enum ColorName {
  red('Red', Color(0xFFFF5252)),
  pink('Pink', Color(0xFFFF4081)),
  purple('Purple', Color(0xFFE040FB)),
  deepPurple('Deep purple', Color(0xFF7C4DFF)),
  indigo('Indigo', Color(0xFF536DFE)),
  blue('Blue', Color(0xFF448AFF)),
  lightBlue('Light blue', Color(0xFF40C4FF)),
  cyan('Cyan', Color(0xFF18FFFF)),
  teal('Teal', Color(0xFF64FFDA)),
  green('Green', Color(0xFF69F0AE)),
  lightGreen('Light green', Color(0xFFB2FF59)),
  lime('Lime', Color(0xFFEEFF41)),
  yellow('Yellow', Color(0xFFFFFF00)),
  amber('Amber', Color(0xFFFFD740)),
  orange('Orange', Color(0xFFFFAB40)),
  deepOrange('Deep orange', Color(0xFFFF6E40)),
  brown('Brown', Color(0xFF795548)),
  grey('Grey', Color(0xFF9E9E9E)),
  blueGrey('Blue grey', Color(0xFF607D8B)),
  darkGrey('Dark grey', Color(0xFF616161));

  const ColorName(this.name, this.color);

  final String name;
  final Color color;

  Color harmonized(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return color.harmonizeWith(primaryColor);
  }

  Scheme harmonizedScheme(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    if (brightness == Brightness.light) {
      return Scheme.light(harmonized(context).value);
    } else {
      return Scheme.dark(harmonized(context).value);
    }
  }

  Color primaryContainer(BuildContext context) {
    return Color(harmonizedScheme(context).primaryContainer);
  }

  Color onPrimaryContainer(BuildContext context) {
    return Color(harmonizedScheme(context).onPrimaryContainer);
  }

  static ColorName fromName(String name) {
    return values.firstWhere(
      (e) => e.name == name,
      orElse: () => red,
    );
  }
}
