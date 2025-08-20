import 'package:fluent_ui/fluent_ui.dart';
import '../../../generated/l10n.dart';
import '../../services/settings_service.dart';
import '../../services/update_service.dart';

enum _SettingsCategory { root, appearance, language, updates }

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  _SettingsCategory _cat = _SettingsCategory.root;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final crumbs = <BreadcrumbItem<_SettingsCategory>>[
      BreadcrumbItem(label: Text(s.nav_settings), value: _SettingsCategory.root),
      if (_cat != _SettingsCategory.root)
        BreadcrumbItem(label: Text(_titleFor(_cat, s)), value: _cat),
    ];

    return ScaffoldPage(
      header: PageHeader(
        title: BreadcrumbBar<_SettingsCategory>(
          items: crumbs,
          onItemPressed: (item) => setState(() => _cat = item.value),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(12),
        child: _buildBody(context, s),
      ),
    );
  }

  String _titleFor(_SettingsCategory c, S s) {
    switch (c) {
      case _SettingsCategory.appearance:
        return s.appearance;
      case _SettingsCategory.language:
        return s.language;
      case _SettingsCategory.updates:
        return s.check_updates;
      case _SettingsCategory.root:
        return s.nav_settings;
    }
  }

  Widget _buildBody(BuildContext context, S s) {
    switch (_cat) {
      case _SettingsCategory.root:
        return _buildRoot(context, s);
      case _SettingsCategory.appearance:
        return const _AppearanceBlock();
      case _SettingsCategory.language:
        return const _LanguageBlock();
      case _SettingsCategory.updates:
        return const _UpdatesBlock();
    }
  }

  Widget _buildRoot(BuildContext context, S s) {
    return ListView(children: [
      _CategoryTile(
        icon: FluentIcons.color,
        title: s.appearance,
        subtitle: s.theme,
        onTap: () => setState(() => _cat = _SettingsCategory.appearance),
      ),
      const SizedBox(height: 16),
      _CategoryTile(
        icon: FluentIcons.locale_language,
        title: s.language,
        subtitle: s.app_language,
        onTap: () => setState(() => _cat = _SettingsCategory.language),
      ),
      const SizedBox(height: 16),
      _CategoryTile(
        icon: FluentIcons.update_restore,
        title: s.check_updates,
        subtitle: s.about,
        onTap: () => setState(() => _cat = _SettingsCategory.updates),
      ),
    ]);
  }
}

class _CategoryTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _CategoryTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final textColor = theme.typography.body?.color;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.brightness == Brightness.dark
              ? const Color(0xFF2D2D2D)
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: theme.brightness == Brightness.dark
                ? const Color(0xFF484848)
                : const Color(0xFFE5E5E5),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 24, color: textColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.typography.subtitle),
                  const SizedBox(height: 4),
                  Text(subtitle, style: theme.typography.caption),
                ],
              ),
            ),
            const SizedBox(width: 16),
            const Icon(FluentIcons.chevron_right),
          ],
        ),
      ),
    );
  }
}

class _AppearanceBlock extends StatelessWidget {
  const _AppearanceBlock();
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final settings = SettingsService.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _SettingRowContainer(
          icon: FluentIcons.settings,
          title: s.theme,
          trailing: SizedBox(
            width: 240,
            child: ComboBox<AppThemeMode>(
              value: settings.themeMode,
              items: [
                ComboBoxItem(value: AppThemeMode.system, child: Text(s.theme_system)),
                ComboBoxItem(value: AppThemeMode.light, child: Text(s.theme_light)),
                ComboBoxItem(value: AppThemeMode.dark, child: Text(s.theme_dark)),
              ],
              onChanged: (v) => v != null ? settings.setTheme(v) : null,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _SettingRowContainer(
          icon: FluentIcons.color,
          title: s.accent_color,
          trailing: SizedBox(
            width: 240,
            child: ComboBox<AppAccent>(
              value: settings.accent,
              items: [
                ComboBoxItem(value: AppAccent.system, child: Text(s.accent_system)),
                ComboBoxItem(value: AppAccent.red, child: Text(s.accent_red)),
                ComboBoxItem(value: AppAccent.blue, child: Text(s.accent_blue)),
                ComboBoxItem(value: AppAccent.green, child: Text(s.accent_green)),
                ComboBoxItem(value: AppAccent.purple, child: Text(s.accent_purple)),
              ],
              onChanged: (v) => v != null ? settings.setAccent(v) : null,
            ),
          ),
        ),
      ],
    );
  }
}

class _LanguageBlock extends StatelessWidget {
  const _LanguageBlock();
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final settings = SettingsService.instance;
    return _SettingRowContainer(
      icon: FluentIcons.locale_language,
      title: s.app_language,
      trailing: SizedBox(
        width: 240,
        child: ComboBox<AppLanguage>(
          value: settings.language,
          items: [
            ComboBoxItem(value: AppLanguage.system, child: Text(s.language_system)),
            ComboBoxItem(value: AppLanguage.en, child: Text(s.language_en)),
            ComboBoxItem(value: AppLanguage.uk, child: Text(s.language_uk)),
          ],
          onChanged: (v) => v != null ? settings.setLanguage(v) : null,
        ),
      ),
    );
  }
}

class _UpdatesBlock extends StatelessWidget {
  const _UpdatesBlock();
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return _SettingRowContainer(
      icon: FluentIcons.update_restore,
      title: s.check_updates,
      trailing: SizedBox(
        width: 180,
        child: Align(
          alignment: Alignment.centerRight,
          child: FilledButton(
            onPressed: () => showDialog(context: context, builder: (_) => const _UpdateDialog()),
            child: Text(s.check_updates),
          ),
        ),
      ),
    );
  }
}

class _SettingRowContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;
  const _SettingRowContainer({
    required this.icon,
    required this.title,
    required this.trailing,
  });
  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final textColor = theme.typography.body?.color;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark
            ? const Color(0xFF2D2D2D)
            : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.brightness == Brightness.dark
              ? const Color(0xFF484848)
              : const Color(0xFFE5E5E5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 24, color: textColor),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: theme.typography.subtitle)),
          const SizedBox(width: 16),
          trailing,
        ],
      ),
    );
  }
}

class _UpdateDialog extends StatefulWidget {
  const _UpdateDialog();
  @override
  State<_UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<_UpdateDialog> {
  String? _status;
  bool _checking = true;
  bool _started = false;
  UpdateInfo? _info;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_started) { _started = true; _check(); }
  }

  Future<void> _check() async {
    final s = S.of(context);
    try {
      // Use UpdateService to check GitHub releases
      final update = await UpdateService.instance.check();
      setState(() {
        _info = update;
        if (update.updateAvailable) {
          _status = '${s.update_available}: ${update.latestVersion}';
        } else {
          _status = s.you_have_latest;
        }
        _checking = false;
      });
    } catch (_) {
      setState(() { _status = s.you_have_latest; _checking = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ContentDialog(
      title: Text(s.check_updates),
      content: _checking
          ? const ProgressBar()
          : Text(_status ?? s.you_have_latest),
      actions: [
        if (!_checking && _info != null && _info!.updateAvailable)
          FilledButton(
            child: const Text('Download'),
            onPressed: () async {
              final info = _info!;
              await UpdateService.instance.openDownload(info);
            },
          ),
        Button(child: const Text('OK'), onPressed: () => Navigator.of(context).pop()),
      ],
    );
  }
}
