import 'package:flutter/material.dart';
import 'package:nutrical/pages/chat_page.dart';
import 'package:nutrical/pages/formula_page.dart';
import 'package:nutrical/providers/routers.dart';
import 'package:nutrical/widgets/heigth_form.dart';

import 'package:lottie/lottie.dart';
import 'package:nutrical/widgets/navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: MyRouter.getRoute,
      home: Scaffold(
        
        body: <Widget> [
          Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 1),
                  pageBuilder: (context, animation, secondaryAnimation) => 
                  FadeTransition(
                    opacity: animation,
                    child: HeigthForm(title: widget.title)
                  ),                    
                ),
              );
            },
            child: Lottie.asset('assets/lottie/Heart.json'),              
          ),
        ),

        FormulaPage(title: widget.title),
        ChatPage(title: widget.title)

        ] [currentPageIndex],
        bottomNavigationBar: NavigationBarMain(
          currentPageIndex: currentPageIndex,
        ),
      ),
    );
  }
}
