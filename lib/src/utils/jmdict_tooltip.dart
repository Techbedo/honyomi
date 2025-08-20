import 'package:fluent_ui/fluent_ui.dart';

// Placeholder for JMdict tooltip. In a real app, you'd query a JMdict database.
class JMDictTooltip extends StatelessWidget {
  final Widget child;
  const JMDictTooltip({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Tooltip(message: 'JMdict info', child: child);
  }
}
