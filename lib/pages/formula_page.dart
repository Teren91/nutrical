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
      body: RichText(
        text: TextSpan(
          children: [
            //TALLA
            WidgetSpan(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('TALLA ', style: Theme.of(context).textTheme.headlineLarge),
              ]),
            ),

            WidgetSpan(child: Container()),
            TextSpan(
                text: 'Altura de la rodilla en cm\n ',
                style: Theme.of(context).textTheme.headlineMedium),
            TextSpan(
                text: 'Talla en el hombre (cm):\n ',
                style: Theme.of(context).textTheme.headlineSmall),
            TextSpan(
                text:
                    ' 64,19 - (0,04 x edad) + (2,02 x altura de la rodilla)',
                style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
                text: '\n Talla en la mujer (cm):\n ',
                style: Theme.of(context).textTheme.headlineSmall),
            TextSpan(
                text:
                    ' 84,88 - (0,24 x edad) + (1,83 x altura de la rodilla)',
                //style: Theme.of(context).textTheme.bodyMedium),
                style: Theme.of(context).textTheme.displaySmall,
                
              ),
                
            TextSpan(
                text: '\nLongitud rodilla-maléolo externo (cm)\n ',
                style: Theme.of(context).textTheme.headlineMedium),
             TextSpan(
                text: 'Talla en el hombre (cm):\n ',
                style: Theme.of(context).textTheme.headlineSmall),
            TextSpan(
                text:
                    ' [LRM (cm) x 1,121] - [0,117 x edad (años)] +119,6 )',
                style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
                text: '\n Talla en la mujer (cm):\n ',
                style: Theme.of(context).textTheme.headlineSmall),
            TextSpan(
                text:
                    ' [LRM (cm) x 1,263] - [0,159 x edad (años)] + 107,7 )',
                style: Theme.of(context).textTheme.bodyMedium),
            //IMC
            WidgetSpan(child: Container()),
            TextSpan(
                text: '\nIMC: ',
                style: Theme.of(context).textTheme.headlineMedium),
            TextSpan(
                text: ' Peso / Talla²',
                style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarMain(
        currentPageIndex: 1,
        isTablet: kIsWeb,
      ),
    );
  }
}
