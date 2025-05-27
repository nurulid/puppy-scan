import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String baseUrl = 'https://api.openai.com/v1';

  Future<String> generateImage(String prompt) async {
    // Get API key from .env
    final apiKey = dotenv.env['OPENAI_API_KEY'];
    
    if (apiKey == null) {
      return 'Error: API key not found';
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/images/generations'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'dall-e-3',
          'prompt': prompt,
          'n': 1,
          'size': '1024x1024',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data'][0]['url'];
      } else {
        print('Error: ${response.body}');
        return 'Error: ${jsonDecode(response.body)['error']['message']}';
      }
    } catch (e) {
      print('Exception: $e');
      return 'Error: $e';
    }
  }
}
