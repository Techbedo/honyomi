import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../providers/app_state.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).about),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildInfoCard(
                context,
                title: S.of(context).appTitle,
                children: [
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: Text(S.of(context).description),
                    subtitle: Text(S.of(context).appDescription),
                  ),
                  ListTile(
                    leading: const Icon(Icons.tag),
                    title: Text(S.of(context).version),
                    subtitle: const Text('1.0.0'), // Replace with dynamic version
                  ),
                  ListTile(
                    leading: const Icon(Icons.gavel),
                    title: Text(S.of(context).license),
                    subtitle: const Text('Apache License 2.0'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                context,
                title: S.of(context).features,
                children: [
                  ListTile(
                    leading: const Icon(Icons.book_outlined),
                    title: Text(S.of(context).personalDictionary),
                    subtitle: Text(S.of(context).personalDictionaryDescription),
                  ),
                  ListTile(
                    leading: const Icon(Icons.picture_as_pdf_outlined),
                    title: Text(S.of(context).pdfReading),
                    subtitle: Text(S.of(context).pdfReadingDescription),
                  ),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(S.of(context).multiLanguageSupport),
                    subtitle: Text(S.of(context).multiLanguageSupportDescription),
                  ),
                  ListTile(
                    leading: const Icon(Icons.design_services_outlined),
                    title: Text(S.of(context).material3Design),
                    subtitle: Text(S.of(context).material3DesignDescription),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(BuildContext context, {required String title, required List<Widget> children}) {
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
}
