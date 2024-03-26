import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutrical/widgets/navigation_bar.dart';

class FormulaPage extends StatefulWidget {
  const FormulaPage({super.key, required this.title});

  final String title;
  
  @override
  State<FormulaPage> createState() => _FormulaPageState();
}

class _FormulaPageState extends State<FormulaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
      body:
        const Center(child: Text('FORMULA')),
      bottomNavigationBar: NavigationBarMain(
          currentPageIndex: 1,
          isTablet: kIsWeb,
        ),
    );
  }
}