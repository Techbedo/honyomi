import 'package:flutter/foundation.dart';

// Conditional imports
import 'platform_file_utils_stub.dart'
    if (dart.library.io) 'platform_file_utils_io.dart'
    if (dart.library.html) 'platform_file_utils_web.dart';

abstract class PlatformFileUtils {
  static bool fileExists(String filePath) {
    return PlatformFileUtilsImpl.fileExists(filePath);
  }

  static String? getWebFileName(String filePath) {
    return PlatformFileUtilsImpl.getWebFileName(filePath);
  }

  static bool get isWeb => kIsWeb;
}
