import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> chatGPT(
  List<Map<String, String>> conversation,
) async {
  final url = Uri.parse(
      'https://team44.openai.azure.com/openai/deployments/nice/chat/completions?api-version=2023-07-01-preview');

  final headers = {
    'Content-Type': 'application/json',
    'api-key': '9f25143a3f90494996386c19d177fe41',
  };

  final payload = {
    'messages': conversation,
    'max_tokens': 800,
    'temperature': 0.7,
    'frequency_penalty': 0,
    'presence_penalty': 0,
    'top_p': 0.95,
    'stop': null,
  };

  final response =
      await http.post(url, headers: headers, body: json.encode(payload));

  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    return res["choices"][0]["message"]["content"];
  } else {
    return "";
  }
}
