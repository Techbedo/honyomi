import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../models/dictionary_word.dart';
import '../providers/app_state.dart';
import '../utils/greeting_utils.dart';
import 'word_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        // Отримуємо випадкові слова для вивчення (не вивчені слова)
        final allWords = appState.dictionaryWords;
        final newWords = allWords.where((word) => !word.isLearned).toList();
        newWords.shuffle();
        final randomWords = newWords.take(5).toList();

        // Отримуємо останні PDF файли
        final recentPdfs = appState.recentFiles.take(5).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).home),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Привітання
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              GreetingUtils.getGreetingIcon(),
                              size: 32,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                GreetingUtils.getGreeting(context),
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          GreetingUtils.getGreetingMessage(context),
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Статистика
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        context,
                        S.of(context).totalWords,
                        allWords.length.toString(),
                        Icons.library_books,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        context,
                        S.of(context).learnedWords,
                        allWords.where((w) => w.isLearned).length.toString(),
                        Icons.check_circle,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Основний контент - адаптивний
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      // Десктопна версія - горизонтальний розподіл
                      return SizedBox(
                        height: 400,
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildWordsSection(context, randomWords),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildRecentFilesSection(context, recentPdfs),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Мобільна версія - вертикальний розподіл
                      return Column(
                        children: [
                          SizedBox(
                            height: 330,
                            child: _buildWordsSection(context, randomWords),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 330,
                            child: _buildRecentFilesSection(context, recentPdfs),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWordsSection(BuildContext context, List<DictionaryWord> randomWords) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).wordsToStudy,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Card(
            child: randomWords.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 48,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          S.of(context).noWordsToStudy,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: randomWords.length,
                    itemBuilder: (context, index) {
                      final word = randomWords[index];
                      return ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          radius: 16,
                          child: Text(
                            word.word[0].toUpperCase(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        title: Text(
                          word.word,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          word.translation,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WordDetailPage(word: word),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentFilesSection(BuildContext context, List<String> recentPdfs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).recentPdfFiles,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Card(
            child: recentPdfs.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.picture_as_pdf_outlined,
                          size: 48,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          S.of(context).noPdfFiles,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: recentPdfs.length,
                    itemBuilder: (context, index) {
                      final filePath = recentPdfs[index];
                      final fileName = filePath.split('/').last.split('\\').last;
                      
                      return ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.picture_as_pdf,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(
                          fileName,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          filePath,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/pdf_viewer',
                            arguments: filePath,
                          );
                        },
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }

}
