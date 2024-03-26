import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutrical/widgets/navigation_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});

  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
      body:
        const Center(child: Text('CHAT')),
      bottomNavigationBar: NavigationBarMain(
          currentPageIndex: 2,
          isTablet: kIsWeb,
        ),
    );
  }
}