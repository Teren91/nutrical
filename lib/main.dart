import 'package:flutter/material.dart';
import 'package:nutrical/pages/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutrical',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          displaySmall:  TextStyle(
            fontSize: 12.0,
            backgroundColor: Colors.amber[50],
            color: Colors.black
          ),
        ),
      ),
      home: const MyHomePage(title: 'NutriCal'),
    );
  }
}

