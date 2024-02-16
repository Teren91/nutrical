import 'package:flutter/material.dart';
import 'package:nutrical/widgets/heigth_form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const SingleChildScrollView(
          child: SafeArea(
            minimum: EdgeInsets.all(12),
            child: HeigthForm(),           
          ),
        ),
      ),
    );
  }
}
