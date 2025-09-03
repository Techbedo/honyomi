// Web implementation using universal_html
import 'dart:convert';
import 'package:universal_html/html.dart' as html;
import 'package:file_picker/file_picker.dart';

class FileExportServiceImpl {
  static Future<void> exportToFile(
    Map<String, dynamic> data, 
    String fileName,
  ) async {
    try {
      final jsonString = const JsonEncoder.withIndent('  ').convert(data);
      
      // Створюємо Blob з JSON даними
      final bytes = utf8.encode(jsonString);
      final blob = html.Blob([bytes], 'application/json');
      
      // Створюємо URL для завантаження
      final url = html.Url.createObjectUrlFromBlob(blob);
      
      // Створюємо посилання для завантаження
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', fileName)
        ..style.display = 'none';
      
      // Додаємо до DOM та натискаємо
      html.document.body?.children.add(anchor);
      anchor.click();
      
      // Очищуємо ресурси
      html.document.body?.children.remove(anchor);
      html.Url.revokeObjectUrl(url);
      
      // File exported successfully via browser download
    } catch (e) {
      throw Exception('Failed to export file: $e');
    }
  }
  
  static Future<Map<String, dynamic>?> importFromFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
        withData: true, // Важливо для веб-платформи
      );

      if (result != null && result.files.single.bytes != null) {
        final bytes = result.files.single.bytes!;
        final jsonString = utf8.decode(bytes);
        final data = jsonDecode(jsonString) as Map<String, dynamic>;
        return data;
      }
      return null;
    } catch (e) {
      throw Exception('Failed to import file: $e');
    }
  }
}
