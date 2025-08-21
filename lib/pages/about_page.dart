import 'package:fluent_ui/fluent_ui.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text('About'),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Icon
              Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: FluentTheme.of(context).accentColor.withOpacity(0.1),
                ),
                child: Icon(
                  FluentIcons.reading_mode_solid,
                  size: 64,
                  color: FluentTheme.of(context).accentColor,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // App Name
              Text(
                'Honyomi',
                style: FluentTheme.of(context).typography.title?.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 8),
              
              // App Tagline
              Text(
                'Your Smart Language Learning Reader',
                style: FluentTheme.of(context).typography.subtitle?.copyWith(
                  color: Colors.grey[100],
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              // Version
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(FluentIcons.info),
                          const SizedBox(width: 8),
                          Text(
                            'Version 1.0.0',
                            style: FluentTheme.of(context).typography.body,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Description
                      Text(
                        'Honyomi is a modern PDF reader designed for language learners. '
                        'It helps you read documents while building your personal dictionary '
                        'and improving your language skills.',
                        style: FluentTheme.of(context).typography.body,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Features
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Features',
                        style: FluentTheme.of(context).typography.subtitle,
                      ),
                      const SizedBox(height: 16),
                      
                      _buildFeatureRow(
                        context,
                        FluentIcons.pdf,
                        'PDF Viewer',
                        'Read PDF documents with zoom and navigation controls',
                      ),
                      const SizedBox(height: 12),
                      
                      _buildFeatureRow(
                        context,
                        FluentIcons.dictionary,
                        'Personal Dictionary',
                        'Build your vocabulary with words from your reading',
                      ),
                      const SizedBox(height: 12),
                      
                      _buildFeatureRow(
                        context,
                        FluentIcons.library,
                        'Recent Files',
                        'Quick access to your recently opened documents',
                      ),
                      const SizedBox(height: 12),
                      
                      _buildFeatureRow(
                        context,
                        FluentIcons.locale_language,
                        'Multi-language',
                        'Support for English and Ukrainian interfaces',
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Developer Info
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Developed by Techbedo',
                        style: FluentTheme.of(context).typography.body?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '© 2024 Techbedo. All rights reserved.',
                        style: FluentTheme.of(context).typography.caption,
                      ),
                      const SizedBox(height: 16),
                      
                      // Links
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HyperlinkButton(
                            child: const Text('GitHub'),
                            onPressed: () {
                              // TODO: Open GitHub link
                              _showLinkDialog(context, 'GitHub', 'https://github.com/Techbedo');
                            },
                          ),
                          const SizedBox(width: 16),
                          HyperlinkButton(
                            child: const Text('Website'),
                            onPressed: () {
                              // TODO: Open website link
                              _showLinkDialog(context, 'Website', 'https://techbedo.com');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow(BuildContext context, IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: FluentTheme.of(context).accentColor,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: FluentTheme.of(context).typography.body?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: FluentTheme.of(context).typography.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showLinkDialog(BuildContext context, String title, String url) {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Would you like to open the following link?'),
            const SizedBox(height: 8),
            SelectableText(
              url,
              style: TextStyle(
                color: FluentTheme.of(context).accentColor,
              ),
            ),
          ],
        ),
        actions: [
          Button(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FilledButton(
            child: const Text('Open'),
            onPressed: () {
              // TODO: Implement URL launcher
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
