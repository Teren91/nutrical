
import 'package:flutter/material.dart';
import 'package:nutrical/widgets/heigth_form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFemale = true;

  void _changeGender(bool value) {
    setState(() {
      isFemale = value;
    });
  }

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // if (states.contains(MaterialState.selected)) {
      //   return const Icon(Icons.check);
      // }
      return const Icon(Icons.check);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.all(12),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector( 
                child: Row(
                  children: [
                    Text(
                      'M',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Switch(
                      value: isFemale,
                      thumbIcon: thumbIcon,
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveThumbColor: Theme.of(context).colorScheme.primary,
                      activeTrackColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5),
                      inactiveTrackColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5),
                      //inactiveThumbImage: Icon(Icons.thumb_up),
                      onChanged: (bool value) {
                        _changeGender(value);
                       
                      },
                    ),
                    Text(
                      'F',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              HeigthForm(isFemale: isFemale),
            ],
          ),
        ),
      ),
    );
  }
}

