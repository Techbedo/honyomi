import 'package:fluent_ui/fluent_ui.dart';
import '../../../generated/l10n.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ScaffoldPage(
      header: PageHeader(title: Text(s.nav_dictionary)),
      content: const Center(child: Text('Dictionary will be here')),
    );
  }
}
