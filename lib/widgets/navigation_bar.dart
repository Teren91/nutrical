import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavigationBarMain extends StatefulWidget {
  NavigationBarMain(
    {
      super.key, 
      required this.currentPageIndex,
      required this.isTablet,
    });

  int currentPageIndex = 0;
  bool isTablet = false;
  @override
  State<NavigationBarMain> createState() => _NavigationBarMainState();
}

class _NavigationBarMainState extends State<NavigationBarMain> {
  

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      
      onDestinationSelected: (int index) {
        setState(() {
          widget.currentPageIndex = index;
        });
        
        switch(index){
          case 0:
            Navigator.pushReplacementNamed(context, '/heigth');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/formula');
            break;
          // case 2:
          //   Navigator.pushReplacementNamed(context, '/chat');
          //   break;
        }
      },
      indicatorColor: Colors.orange[200],
      selectedIndex: widget.currentPageIndex,
      destinations: const <Widget> [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.task), label: 'Fórmulas'),
       // NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
      ],
      
    );
  }
}
