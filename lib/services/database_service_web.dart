import 'dart:async';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

Future<Database> initDatabase(int version, FutureOr<void> Function(Database, int) onCreate, FutureOr<void> Function(Database, int, int) onUpgrade) async {
  // Веб платформа
  var factory = databaseFactoryFfiWeb;
  return await factory.openDatabase('honyomi_web.db', 
    options: OpenDatabaseOptions(
      version: version, 
      onCreate: onCreate, 
      onUpgrade: onUpgrade
    )
  );
}
