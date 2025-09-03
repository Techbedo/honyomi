import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../generated/l10n.dart';
import '../providers/app_state.dart';
import '../services/file_export_service.dart';
import '../services/update_service.dart';
import 'about_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isCheckingUpdates = false;

  void _showAwesomeSnackBar(String title, String message, ContentType contentType) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );
    
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  Future<void> _checkForUpdates() async {
    if (!mounted) return;
    
    setState(() {
      _isCheckingUpdates = true;
    });

    try {
      final updateInfo = await UpdateService.checkForUpdates();
      
      if (!mounted) return;
      
      if (updateInfo != null) {
        _showUpdateDialog(updateInfo);
      } else {
        _showNoUpdatesDialog();
      }
    } catch (e) {
      if (!mounted) return;
      _showErrorDialog(e.toString());
    } finally {
      if (mounted) {
        setState(() {
          _isCheckingUpdates = false;
        });
      }
    }
  }

  void _showUpdateDialog(UpdateInfo updateInfo) {
    final l10n = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.updateAvailable),
        content: Text(l10n.updateAvailableMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              UpdateService.downloadUpdate(updateInfo.downloadUrl);
            },
            child: Text(l10n.downloadUpdate),
          ),
        ],
      ),
    );
  }

  void _showNoUpdatesDialog() {
    final l10n = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.noUpdatesAvailable),
        content: Text(l10n.appUpToDate),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String error) {
    final l10n = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.error),
        content: Text(l10n.updateCheckError),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Налаштування теми
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.palette, color: Theme.of(context).primaryColor),
                        const SizedBox(width: 16),
                        Text(
                          l10n.appearance,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<ThemeMode>(
                      value: appState.themeMode,
                      decoration: InputDecoration(
                        labelText: l10n.themeMode,
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: ThemeMode.light,
                          child: Text(l10n.lightTheme),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.dark,
                          child: Text(l10n.darkTheme),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.system,
                          child: Text(l10n.systemTheme),
                        ),
                      ],
                      onChanged: (mode) {
                        if (mode != null) {
                          appState.setThemeMode(mode);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Налаштування мови
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.language, color: Theme.of(context).primaryColor),
                        const SizedBox(width: 16),
                        Text(
                          l10n.language,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      initialValue: appState.currentLanguage,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      items: const [
                        DropdownMenuItem(value: 'en', child: Text('English')),
                        DropdownMenuItem(value: 'uk', child: Text('Українська')),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          appState.setLanguage(value);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Налаштування оновлень
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.update, color: Theme.of(context).primaryColor),
                        const SizedBox(width: 16),
                        Text(
                          l10n.updates,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<UpdateChannel>(
                      initialValue: appState.updateChannel,
                      decoration: InputDecoration(
                        labelText: l10n.updateChannel,
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: UpdateChannel.stable,
                          child: Text(l10n.stable),
                        ),
                        DropdownMenuItem(
                          value: UpdateChannel.beta,
                          child: Text(l10n.beta),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          appState.setUpdateChannel(value);
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _isCheckingUpdates ? null : _checkForUpdates,
                        icon: _isCheckingUpdates 
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.refresh),
                        label: Text(
                          _isCheckingUpdates 
                              ? l10n.checkingForUpdates 
                              : l10n.checkForUpdates,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Імпорт/Експорт
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.import_export, color: Theme.of(context).primaryColor),
                        const SizedBox(width: 16),
                        Text(
                          l10n.importExport,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              try {
                                final data = await appState.exportDictionary();
                                final exportData = {'words': data};
                                await FileExportService.exportToFile(exportData, 'honyomi_dictionary.json');
                                if (context.mounted) {
                                  _showAwesomeSnackBar(
                                    l10n.exportSuccessful,
                                    l10n.dictionaryExportedDesktop,
                                    ContentType.success,
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  _showAwesomeSnackBar(
                                    l10n.error,
                                    l10n.exportFailed('$e'),
                                    ContentType.failure,
                                  );
                                }
                              }
                            },
                            icon: const Icon(Icons.file_download),
                            label: Text(l10n.exportWords),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              try {
                                final data = await FileExportService.importFromFile();
                                if (data != null && data['words'] != null) {
                                  await appState.importDictionary(List<Map<String, dynamic>>.from(data['words']));
                                  if (context.mounted) {
                                    _showAwesomeSnackBar(
                                      l10n.importSuccessful,
                                      l10n.dictionaryImportedSuccess((data['words'] as List).length),
                                      ContentType.success,
                                    );
                                  }
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  _showAwesomeSnackBar(
                                    l10n.error,
                                    l10n.importFailed('$e'),
                                    ContentType.failure,
                                  );
                                }
                              }
                            },
                            icon: const Icon(Icons.file_upload),
                            label: Text(l10n.importWords),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Інформація про програму
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info, color: Theme.of(context).primaryColor),
                        const SizedBox(width: 16),
                        Text(
                          l10n.appInformation,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AboutPage()),
                          );
                        },
                        icon: const Icon(Icons.info_outline),
                        label: Text(l10n.about),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
