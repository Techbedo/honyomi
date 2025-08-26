// IO implementation (desktop/mobile platforms)
import 'dart:io';

class PlatformFileUtilsImpl {
  static bool fileExists(String filePath) {
    try {
      return File(filePath).existsSync();
    } catch (e) {
      return false;
    }
  }
  
  static String? getWebFileName(String filePath) {
    return null; // Not needed for IO platforms
  }
}
