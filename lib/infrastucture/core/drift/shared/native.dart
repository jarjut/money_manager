// coverage:ignore-file

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// constructDB based on the platform.
AppDatabase constructDB() {
  final db = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    debugPrint('db path: ${file.path}');
    return NativeDatabase(file);
  });
  return AppDatabase(db);
}
