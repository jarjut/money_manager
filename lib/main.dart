import 'package:flutter/material.dart';
import 'package:moneymanager/injection.dart';
import 'package:moneymanager/presentation/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const App());
}
