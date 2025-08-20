import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateInfo {
  final String currentVersion;
  final String latestVersion;
  final String releasePageUrl;
  final String? assetUrl;
  final bool updateAvailable;
  UpdateInfo({
    required this.currentVersion,
    required this.latestVersion,
    required this.releasePageUrl,
    required this.assetUrl,
    required this.updateAvailable,
  });
}

class UpdateService {
  static const _owner = 'Techbedo';
  static const _repo = 'honyomi';
  static final instance = UpdateService._();
  UpdateService._();

  Future<UpdateInfo> check() async {
    final pkg = await PackageInfo.fromPlatform();
    final current = pkg.version; // e.g., 1.0.0
    final uri = Uri.https('api.github.com', '/repos/$_owner/$_repo/releases/latest');
    final res = await http.get(uri, headers: { 'Accept': 'application/vnd.github+json' });
    if (res.statusCode != 200) {
      return UpdateInfo(
        currentVersion: current,
        latestVersion: current,
        releasePageUrl: 'https://github.com/$_owner/$_repo/releases',
        assetUrl: null,
        updateAvailable: false,
      );
    }
    final data = json.decode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
    final tag = (data['tag_name'] as String?) ?? (data['name'] as String? ?? '');
    final latest = tag.startsWith('v') ? tag.substring(1) : tag;

    bool isNewer = _isNewer(latest, current);
    String htmlUrl = (data['html_url'] as String?) ?? 'https://github.com/$_owner/$_repo/releases';
    String? assetUrl = _pickAssetUrl(data['assets'] as List<dynamic>?);

    return UpdateInfo(
      currentVersion: current,
      latestVersion: latest.isEmpty ? current : latest,
      releasePageUrl: htmlUrl,
      assetUrl: assetUrl,
      updateAvailable: isNewer,
    );
  }

  Future<void> openDownload(UpdateInfo info) async {
    final url = info.assetUrl ?? info.releasePageUrl;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  bool _isNewer(String a, String b) {
    // naive semver compare a > b
    List<int> parse(String v) {
      final parts = v.split('+').first.split('-').first.split('.');
      return [for (var i = 0; i < 3; i++) int.tryParse(parts.length > i ? parts[i] : '0') ?? 0];
    }
    final pa = parse(a);
    final pb = parse(b);
    for (var i = 0; i < 3; i++) {
      if (pa[i] != pb[i]) return pa[i] > pb[i];
    }
    return false;
  }

  String? _pickAssetUrl(List<dynamic>? assets) {
    if (assets == null) return null;
    List<Map<String, dynamic>> list = assets.cast<Map<String, dynamic>>();
    if (kIsWeb) {
      return null; // open release page on web
    }
    if (Platform.isAndroid) {
      final apk = list.firstWhere(
        (a) => (a['browser_download_url'] as String?)?.toLowerCase().endsWith('.apk') == true,
        orElse: () => const {},
      );
      return apk['browser_download_url'] as String?;
    }
    if (Platform.isWindows) {
      final msix = list.firstWhere(
        (a) => (a['browser_download_url'] as String?)?.toLowerCase().endsWith('.msix') == true,
        orElse: () => const {},
      );
      if (msix.isNotEmpty) return msix['browser_download_url'] as String?;
      final exe = list.firstWhere(
        (a) => (a['browser_download_url'] as String?)?.toLowerCase().endsWith('.exe') == true,
        orElse: () => const {},
      );
      return exe['browser_download_url'] as String?;
    }
    // Fallback for other platforms
    return null;
  }
}
