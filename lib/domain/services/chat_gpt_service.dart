
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatGPTService {
  final String  _apiUrl = 'https://api.openai.com/v1/chat/completions';
  
  final String _apiKey = dotenv.env['OPENAI_KEY']!;
  late OpenAI openAI;

  Future<String> getResponse(String message) async
  {
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey'        
      },
      body: jsonEncode({
        'model': 'davinci-002',
        'prompt': message,
       // 'max_tokens': 60
      })
    );
    //davinci-002
    //gpt-3.5-turbo
//print(response.body.toString());
    if(response.statusCode == 200)
    {
   
      return jsonDecode(response.body)['choices'][0]['text'];
    }else
    {
     
      throw Exception('Failed to load response');
    }
  }

  // Future<void> gptFunctionCalling() async {
  //   final request = ChatCompleteText(
  //     messages: [
  //       Messages(
  //               role: Role.user,
  //               content: "What is the weather like in Boston?",
  //               name: "get_current_weather")
  //           .toJson(),
  //     ],
  //     maxToken: 200,
  //     model: Gpt41106PreviewChatModel(),
  //     tools: [
  //       {
  //         "type": "function",
  //         "function": {
  //           "name": "get_current_weather",
  //           "description": "Get the current weather in a given location",
  //           "parameters": {
  //             "type": "object",
  //             "properties": {
  //               "location": {
  //                 "type": "string",
  //                 "description": "The city and state, e.g. San Francisco, CA"
  //               },
  //               "unit": {
  //                 "type": "string",
  //                 "enum": ["celsius", "fahrenheit"]
  //               }
  //             },
  //             "required": ["location"]
  //           }
  //         }
  //       }
  //     ],
  //     toolChoice: 'auto',
  //   );

  //   ChatCTResponse? response = await openAI.onChatCompletion(request: request);
  // //  print("$response");
  // }
}