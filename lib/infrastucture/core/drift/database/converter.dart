part of 'tables.dart';

/// {@template color_converter}
/// A [TypeConverter] that converts [Color] to [int] and vice versa.
/// {@endtemplate}
class ColorConverter extends TypeConverter<Color, int> {
  /// {@macro color_converter}
  const ColorConverter();

  @override
  Color fromSql(int fromDb) => Color(fromDb);

  @override
  int toSql(Color value) => value.value;
}
