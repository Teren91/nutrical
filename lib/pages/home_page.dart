import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutrical/pages/chat_page.dart';
import 'package:nutrical/pages/formula_page.dart';
import 'package:nutrical/providers/routers.dart';
import 'package:nutrical/widgets/heigth_form.dart';

import 'package:lottie/lottie.dart';
import 'package:nutrical/widgets/heigth_form_tablet.dart';
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
    double widthComponent = MediaQuery.of(context).size.width;
    bool isTablet = widthComponent > 600 ? true : false;

    return MaterialApp(
      onGenerateRoute: MyRouter.getRoute,
      home: Scaffold(
         appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
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
                    child: kIsWeb  || widthComponent > 600 ?                       
                      HeigthFormTablet(title: widget.title)
                      : HeigthForm(title: widget.title),//HeigthForm(title: widget.title)
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
          isTablet: isTablet,
        ),
      ),
    );
  }
}
