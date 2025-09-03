import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

enum UpdateChannel { stable, beta }

class UpdateInfo {
  final String version;
  final String downloadUrl;
  final String changelog;
  final bool isPrerelease;

  UpdateInfo({
    required this.version,
    required this.downloadUrl,
    required this.changelog,
    required this.isPrerelease,
  });
}

class UpdateService {
  static const String _githubApiUrl = 'https://api.github.com/repos/Techbedo/honyomi/releases';
  
  static Future<UpdateInfo?> checkForUpdates({
    UpdateChannel channel = UpdateChannel.stable,
  }) async {
    if (kIsWeb) {
      // Веб версія не підтримує оновлення
      return null;
    }

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;
      
      // Отримуємо список релізів з GitHub
      final response = await http.get(Uri.parse(_githubApiUrl));
      
      if (response.statusCode != 200) {
        throw Exception('Failed to fetch releases: ${response.statusCode}');
      }
      
      final List<dynamic> releases = jsonDecode(response.body);
      
      // Фільтруємо релізи залежно від каналу
      final filteredReleases = releases.where((release) {
        final bool isPrerelease = release['prerelease'] ?? false;
        return channel == UpdateChannel.beta || !isPrerelease;
      }).toList();
      
      if (filteredReleases.isEmpty) {
        return null;
      }
      
      // Беремо найновіший реліз
      final latestRelease = filteredReleases.first;
      final latestVersion = (latestRelease['tag_name'] as String).replaceFirst('v', '');
      
      // Порівнюємо версії
      if (_isVersionNewer(latestVersion, currentVersion)) {
        // Знаходимо відповідний файл для платформи
        final assets = latestRelease['assets'] as List<dynamic>;
        String? downloadUrl;
        
        if (Platform.isWindows) {
          final windowsAsset = assets.firstWhere(
            (asset) => (asset['name'] as String).toLowerCase().endsWith('.exe'),
            orElse: () => null,
          );
          downloadUrl = windowsAsset?['browser_download_url'];
        } else if (Platform.isAndroid) {
          final androidAsset = assets.firstWhere(
            (asset) => (asset['name'] as String).toLowerCase().endsWith('.apk'),
            orElse: () => null,
          );
          downloadUrl = androidAsset?['browser_download_url'];
        } else if (Platform.isLinux) {
          final linuxAsset = assets.firstWhere(
            (asset) => (asset['name'] as String).toLowerCase().contains('flatpak') ||
                       (asset['name'] as String).toLowerCase().endsWith('.flatpak'),
            orElse: () => null,
          );
          downloadUrl = linuxAsset?['browser_download_url'];
        }
        
        if (downloadUrl != null) {
          return UpdateInfo(
            version: latestVersion,
            downloadUrl: downloadUrl,
            changelog: latestRelease['body'] ?? '',
            isPrerelease: latestRelease['prerelease'] ?? false,
          );
        }
      }
      
      return null;
    } catch (e) {
      throw Exception('Failed to check for updates: $e');
    }
  }
  
  static bool _isVersionNewer(String newVersion, String currentVersion) {
    final newParts = newVersion.split('.').map(int.parse).toList();
    final currentParts = currentVersion.split('.').map(int.parse).toList();
    
    // Додаємо нулі якщо версії мають різну кількість частин
    while (newParts.length < currentParts.length) {
      newParts.add(0);
    }
    while (currentParts.length < newParts.length) {
      currentParts.add(0);
    }
    
    for (int i = 0; i < newParts.length; i++) {
      if (newParts[i] > currentParts[i]) {
        return true;
      } else if (newParts[i] < currentParts[i]) {
        return false;
      }
    }
    
    return false;
  }
  
  static Future<void> downloadUpdate(String downloadUrl) async {
    if (await canLaunchUrl(Uri.parse(downloadUrl))) {
      await launchUrl(Uri.parse(downloadUrl), mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $downloadUrl');
    }
  }
}
