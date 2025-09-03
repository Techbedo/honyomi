import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> initDatabase(int version, FutureOr<void> Function(Database, int) onCreate, FutureOr<void> Function(Database, int, int) onUpgrade) async {
  // Desktop платформи
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  
  // Використовуємо файлову систему
  final documentsDirectory = await getApplicationDocumentsDirectory();
  final path = join(documentsDirectory.path, 'honyomi.db');
  return await openDatabase(path, version: version, onCreate: onCreate, onUpgrade: onUpgrade);
}
