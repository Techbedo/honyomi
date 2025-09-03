// IO implementation (desktop/mobile platforms)
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class FileExportServiceImpl {
  static Future<void> exportToFile(
    Map<String, dynamic> data, 
    String fileName,
  ) async {
    try {
      final jsonString = const JsonEncoder.withIndent('  ').convert(data);
      
      Directory directory;
      
      if (Platform.isAndroid) {
        // На Android API 30+ використовуємо Downloads папку
        try {
          // Спочатку пробуємо getExternalStorageDirectory
          final externalDir = await getExternalStorageDirectory();
          if (externalDir != null) {
            // Створюємо папку Download якщо її немає
            directory = Directory('${externalDir.path}/Download');
            if (!await directory.exists()) {
              await directory.create(recursive: true);
            }
          } else {
            // Fallback до application documents
            directory = await getApplicationDocumentsDirectory();
          }
        } catch (e) {
          // Якщо все інше не працює, використовуємо внутрішню папку
          directory = await getApplicationDocumentsDirectory();
        }
      } else {
        // На інших платформах використовуємо Documents папку
        directory = await getApplicationDocumentsDirectory();
      }
      
      final file = File('${directory.path}/$fileName');
      await file.writeAsString(jsonString);
      
      // File exported successfully
    } catch (e) {
      throw Exception('Failed to export file: $e');
    }
  }
  
  static Future<Map<String, dynamic>?> importFromFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        final jsonString = await file.readAsString();
        final data = jsonDecode(jsonString) as Map<String, dynamic>;
        return data;
      }
      return null;
    } catch (e) {
      throw Exception('Failed to import file: $e');
    }
  }
}
