import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutrical/domain/services/chat_gpt_service.dart';
import 'package:nutrical/widgets/navigation_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});

  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<String> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) async {
    if(text.isEmpty) return;

    _textController.clear();
    setState(() {
      _messages.add('User: $text');
    });

    final String response = await ChatGPTService().getResponse(text);
    setState(() {
      _messages.add('ChatGPT: $response');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(_messages[index])),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration:
                        const InputDecoration(hintText: 'Send a message'),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => _handleSubmitted(_textController.text),
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarMain(
        currentPageIndex: 2,
        isTablet: kIsWeb,
      ),
    );
  }
}
