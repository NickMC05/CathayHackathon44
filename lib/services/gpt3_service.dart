import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<String> chatGPT(
  List<Map<String, String>> conversation,
) async {
  try {
    const endpoint = "https://team44.openai.azure.com/";

    final headers = {
      // Replace with your Azure authorization header
      'api-key': '9f25143a3f90494996386c19d177fe41',
      'Content-Type': 'Application/json'
    };

    final body = {'messages': conversation};

    final request = http.Request(
      'POST',
      // Replace with your Azure GPT service endpoint
      Uri.parse(endpoint),
    );

    request.body = json.encode(body);
    request.headers.addAll(headers);

    final httpResponse = await request.send();


    if (httpResponse.statusCode == 200) {
      
      final jsonResponse =
          jsonDecode(await httpResponse.stream.bytesToString());
      // Adjust the response parsing as needed based on Azure's response structure
      final content = jsonResponse['choices'][0]['message']['content'].toString();
      final modifiedText = content.trim();
      return modifiedText;
    } else {
      if (kDebugMode) {
        print(httpResponse.reasonPhrase);
      }
      return '';
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error in chatGPT: $e");
    }
    return '';
  }
}

Future<void> mickey() async {
  const String apiKey = '9f25143a3f90494996386c19d177fe41';
  // Use the appropriate API key as needed.

  final Uri apiUrl = Uri.parse('https://team44.openai.azure.com/');

  final response = await http.post(
    apiUrl,
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
    body: jsonEncode(<String, dynamic>{
      'model': 'SkyDreamers',
      'prompt': 'Write a tagline for an ice cream shop. ',
      'max_tokens': 10,
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final String text = data['choices'][0]['text'].replaceAll('\n', '').replaceAll(' .', '.').trim();
    print('Write a tagline for an ice cream shop. $text');
  } else {
    print('Failed to get data. Status code: ${response.statusCode}');
  }
}