
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ChatGPTService {
  final String  _apiUrl = 'https://api.openai.com/v1/engines/davinci-codex/completions';
  final String _apiKey = dotenv.env['OPENAI_KEY']!;


  Future<String> getResponse(String message) async
  {
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey'
      },
      body: jsonEncode({
        'prompt': message,
        'max_tokens': 60
      })
    );

    if(response.statusCode == 200)
    {
      return jsonDecode(response.body)['choices'][0]['text'];
    }else
    {
      throw Exception('Failed to load response');
    }
  }
}