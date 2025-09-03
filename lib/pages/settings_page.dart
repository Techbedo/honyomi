import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../providers/app_state.dart';
import 'about_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).settings)),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildSettingsCard(
                context,
                title: S.of(context).general,
                children: [
                  ListTile(
                    leading: const Icon(Icons.palette_outlined),
                    title: Text(S.of(context).theme),
                    subtitle: Text(
                      _getThemeModeName(context, appState.themeMode),
                    ),
                    onTap: () => _showThemeDialog(context, appState),
                  ),
                  ListTile(
                    leading: const Icon(Icons.language_outlined),
                    title: Text(S.of(context).language),
                    subtitle: Text(
                      _getLanguageName(appState.locale.languageCode),
                    ),
                    onTap: () => _showLanguageDialog(context, appState),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSettingsCard(
                context,
                title: S.of(context).pdfViewerSettings,
                children: [
                  SwitchListTile(
                    secondary: const Icon(Icons.zoom_in_outlined),
                    title: Text(S.of(context).enableZoom),
                    subtitle: Text(S.of(context).allowZoomingInPdfViewer),
                    value: true, // Replace with actual setting value
                    onChanged: (value) {
                      // TODO: Implement zoom setting
                    },
                  ),
                  SwitchListTile(
                    secondary: const Icon(Icons.bookmark_outline),
                    title: Text(S.of(context).autoSaveBookmarks),
                    subtitle: Text(
                      S.of(context).automaticallySaveReadingPosition,
                    ),
                    value: true, // Replace with actual setting value
                    onChanged: (value) {
                      // TODO: Implement bookmark setting
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSettingsCard(
                context,
                title: S.of(context).dictionaryManagement,
                children: [
                  ListTile(
                    leading: const Icon(Icons.upload_outlined),
                    title: Text(S.of(context).exportDictionary),
                    subtitle: Text('Export your dictionary to a file'),
                    onTap: () async {
                      final data = await appState.exportDictionary();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Dictionary exported: ${data.length} words',
                            ),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                          ),
                        );
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.download_outlined),
                    title: Text(S.of(context).importDictionary),
                    subtitle: Text('Import dictionary from a file'),
                    onTap: () {
                      // TODO: Implement import functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Import feature coming soon'),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSettingsCard(
                context,
                title: 'App Information',
                children: [
                  ListTile(
                    leading: const Icon(Icons.info_outlined),
                    title: Text(S.of(context).aboutApp),
                    subtitle: Text('Learn more about Honyomi'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.system_update_outlined),
                    title: Text(S.of(context).checkForUpdates),
                    subtitle: Text('Check for app updates'),
                    enabled: false, // Поки неактивна
                    onTap: () {
                      // TODO: Implement update check
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSettingsCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  String _getThemeModeName(BuildContext context, ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return S.of(context).system;
      case ThemeMode.light:
        return S.of(context).light;
      case ThemeMode.dark:
        return S.of(context).dark;
    }
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'uk':
        return 'Українська';
      default:
        return '';
    }
  }

  void _showThemeDialog(BuildContext context, AppState appState) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).theme),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<ThemeMode>(
                title: Text(S.of(context).system),
                value: ThemeMode.system,
                groupValue: appState.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    appState.setThemeMode(value);
                  }
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text(S.of(context).light),
                value: ThemeMode.light,
                groupValue: appState.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    appState.setThemeMode(value);
                  }
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text(S.of(context).dark),
                value: ThemeMode.dark,
                groupValue: appState.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    appState.setThemeMode(value);
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context, AppState appState) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).language),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<Locale>(
                title: const Text('English'),
                value: const Locale('en'),
                groupValue: appState.locale,
                onChanged: (value) {
                  if (value != null) {
                    appState.setLocale(value);
                  }
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<Locale>(
                title: const Text('Українська'),
                value: const Locale('uk'),
                groupValue: appState.locale,
                onChanged: (value) {
                  if (value != null) {
                    appState.setLocale(value);
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
