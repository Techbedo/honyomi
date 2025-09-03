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
      
      // Зберігаємо у Documents папку
      final directory = await getApplicationDocumentsDirectory();
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
