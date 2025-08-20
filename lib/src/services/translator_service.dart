import 'dart:convert';
import 'package:http/http.dart' as http;

// NOTE: Google Translate official API requires API key billing (Cloud Translation).
// For demo purposes only, this uses an unofficial endpoint if provided via env.
// Replace with your own backend proxy or official API call in production.
class TranslatorService {
  TranslatorService._();
  static final instance = TranslatorService._();

  // Configure via --dart-define=TRANSLATE_API_URL=<your-endpoint>
  static const _baseUrl = String.fromEnvironment('TRANSLATE_API_URL');
  static const _apiKey = String.fromEnvironment('TRANSLATE_API_KEY');

  Future<String?> translate(String text, {String from = 'auto', String to = 'en'}) async {
    if (_baseUrl.isEmpty) {
      // Fallback no-op
      return text;
    }
    try {
      final uri = Uri.parse(_baseUrl).replace(queryParameters: {
        'q': text,
        'source': from,
        'target': to,
        if (_apiKey.isNotEmpty) 'key': _apiKey,
      });
      final res = await http.get(uri);
      if (res.statusCode == 200) {
        final data = json.decode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
        return data['translatedText'] as String? ?? data['data']?['translations']?[0]?['translatedText'] as String?;
      }
    } catch (_) {}
    return null;
  }
}
