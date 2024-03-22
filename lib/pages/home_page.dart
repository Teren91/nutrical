import 'package:flutter/material.dart';
import 'package:nutrical/widgets/heigth_form.dart';

import 'package:lottie/lottie.dart';

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
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: Text(widget.title),
        // ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 1),
                  pageBuilder: (context, animation, secondaryAnimation) => 
                  FadeTransition(
                    opacity: animation,
                    child: const HeigthForm()
                  ),                    
                ),
              );
            },
            child: Lottie.asset('assets/lottie/Heart.json'),              
          ),
        ),
      ),
    );
  }
}
