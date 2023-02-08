import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcon {
  final String name;
  final IconData iconData;
  final String query;

  AppIcon(this.name, this.iconData, [this.query = '']);

  String get queryName => '$name $query';
}

List<AppIcon> appIconList = [
  AppIcon('money', FontAwesomeIcons.moneyBill),
  AppIcon('piggy-bank', FontAwesomeIcons.piggyBank),
  AppIcon('piggy-bank', FontAwesomeIcons.piggyBank),
];
