
import 'package:flutter/material.dart';
import 'package:nutrical/pages/heigth_page.dart';
import 'package:nutrical/widgets/heigth_form.dart';

import '../pages/nutrical.dart';

class MyRouter {
  
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (context) => 
            const HeigthForm(title: 'Nutrical')
        );
      case '/formula':
        return MaterialPageRoute(builder: (context) => const  FormulaPage(title: 'Nutrical'));
      case '/chat':
        return MaterialPageRoute(builder: (context) => const ChatPage(title: 'Nutrical'));
      case '/heigth':
        return MaterialPageRoute(builder: (context) => const HeigthPage(title: 'Nutrical'));
      default:
        return MaterialPageRoute(builder: (context) => const HeigthPage(title: 'Nutrical'));
    }
  }
}