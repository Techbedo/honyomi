import 'package:fluent_ui/fluent_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../generated/l10n.dart';
import 'dart:async';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  PackageInfo? _info;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final info = await PackageInfo.fromPlatform();
    if (mounted) setState(() => _info = info);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ScaffoldPage(
      header: PageHeader(
        title: Row(children: [
          const Icon(FluentIcons.info),
          const SizedBox(width: 8),
          Text(s.about),
        ]),
      ),
      content: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Honyomi', style: FluentTheme.of(context).typography.title),
          const SizedBox(height: 8),
          Text('${s.app_version}: ${_info?.version ?? '...'}+${_info?.buildNumber ?? ''}'),
          const SizedBox(height: 16),
          Text(s.translator_provider + ': Google Cloud Translation (configurable)'),
        ]),
      ),
    );
  }
}
