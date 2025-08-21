import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text('Settings'),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AppState>(
          builder: (context, appState, child) {
            return ListView(
              children: [
                // Theme Settings
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Appearance',
                          style: FluentTheme.of(context).typography.subtitle,
                        ),
                        const SizedBox(height: 16),
                        
                        // Theme Selection
                        Row(
                          children: [
                            const Icon(FluentIcons.color_solid),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Theme', style: FluentTheme.of(context).typography.body),
                                  const SizedBox(height: 4),
                                  Text('Choose your preferred theme', style: FluentTheme.of(context).typography.caption),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            ComboBox<AppTheme>(
                              value: appState.currentTheme,
                              items: AppTheme.values.map<ComboBoxItem<AppTheme>>((theme) {
                                return ComboBoxItem<AppTheme>(
                                  value: theme,
                                  child: Text(
                                    theme == AppTheme.light ? 'Light' :
                                    theme == AppTheme.dark ? 'Dark' : 'System'
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  appState.updateTheme(value);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Language Settings
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Language',
                          style: FluentTheme.of(context).typography.subtitle,
                        ),
                        const SizedBox(height: 16),
                        
                        Row(
                          children: [
                            const Icon(FluentIcons.locale_language),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Language', style: FluentTheme.of(context).typography.body),
                                  const SizedBox(height: 4),
                                  Text('Select your preferred language', style: FluentTheme.of(context).typography.caption),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            ComboBox<AppLocale>(
                              value: appState.currentLocale,
                              items: AppLocale.values.map<ComboBoxItem<AppLocale>>((locale) {
                                return ComboBoxItem<AppLocale>(
                                  value: locale,
                                  child: Text(
                                    locale == AppLocale.ukrainian ? 'Українська' : 'English'
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  appState.updateLocale(value);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Storage Settings
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Storage',
                          style: FluentTheme.of(context).typography.subtitle,
                        ),
                        const SizedBox(height: 16),
                        
                        Row(
                          children: [
                            const Icon(FluentIcons.clear),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Clear Recent Files', style: FluentTheme.of(context).typography.body),
                                  const SizedBox(height: 4),
                                  Text('Remove all recently opened files from the list', style: FluentTheme.of(context).typography.caption),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Button(
                              onPressed: appState.recentFiles.isNotEmpty ? () {
                                _showClearRecentFilesDialog(context, appState);
                              } : null,
                              child: const Text('Clear'),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 16),
                        
                        Row(
                          children: [
                            const Icon(FluentIcons.dictionary_remove),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Clear Dictionary', style: FluentTheme.of(context).typography.body),
                                  const SizedBox(height: 4),
                                  Text('Remove all words from your personal dictionary', style: FluentTheme.of(context).typography.caption),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Button(
                              onPressed: appState.dictionaryWords.isNotEmpty ? () {
                                _showClearDictionaryDialog(context, appState);
                              } : null,
                              child: const Text('Clear'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Statistics
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Statistics',
                          style: FluentTheme.of(context).typography.subtitle,
                        ),
                        const SizedBox(height: 16),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatCard(
                              context,
                              'Recent Files',
                              appState.recentFiles.length.toString(),
                              FluentIcons.library,
                            ),
                            _buildStatCard(
                              context,
                              'Dictionary Words',
                              appState.dictionaryWords.length.toString(),
                              FluentIcons.dictionary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FluentTheme.of(context).accentColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: FluentTheme.of(context).accentColor),
          const SizedBox(height: 8),
          Text(
            value,
            style: FluentTheme.of(context).typography.title?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: FluentTheme.of(context).typography.caption,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showClearRecentFilesDialog(BuildContext context, AppState appState) {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Clear Recent Files'),
        content: const Text('Are you sure you want to clear all recent files? This action cannot be undone.'),
        actions: [
          Button(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FilledButton(
            child: const Text('Clear'),
            onPressed: () {
              appState.clearRecentFiles();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _showClearDictionaryDialog(BuildContext context, AppState appState) {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Clear Dictionary'),
        content: const Text('Are you sure you want to clear all dictionary words? This action cannot be undone.'),
        actions: [
          Button(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FilledButton(
            child: const Text('Clear'),
            onPressed: () {
              // Clear all dictionary words
              while (appState.dictionaryWords.isNotEmpty) {
                appState.removeDictionaryWord(0);
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
