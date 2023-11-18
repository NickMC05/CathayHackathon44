import 'package:http/http.dart' as http;
import 'dart:convert';

class OpenAI {
  static const String apiKey = "9f25143a3f90494996386c19d177fe41";
  static const String apiUrl = "https://team44.openai.azure.com/";

  OpenAI();

  Future<String> complete(String prompt) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'api-key': apiKey,
      },
      body: jsonEncode({'prompt': prompt, 'max_tokens': 100}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'];
    } else {
      throw Exception('Failed to complete request: ${response.statusCode}');
    }
  }
}
