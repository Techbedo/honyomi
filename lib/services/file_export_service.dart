import 'package:flutter/foundation.dart';

// Conditional imports for file handling
import 'file_export_service_io.dart' if (dart.library.html) 'file_export_service_web.dart';

abstract class FileExportService {
  /// Export data to a JSON file
  static Future<void> exportToFile(
    Map<String, dynamic> data, 
    String fileName,
  ) async {
    return FileExportServiceImpl.exportToFile(data, fileName);
  }
  
  /// Import data from a JSON file
  static Future<Map<String, dynamic>?> importFromFile() async {
    return FileExportServiceImpl.importFromFile();
  }
  
  /// Check if the platform is web
  static bool get isWeb => kIsWeb;
}
