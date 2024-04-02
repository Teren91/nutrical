import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutrical/utils/theme.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              children: [
                //TALLA
                WidgetSpan(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('TALLA ',
                            style: Theme.of(context).textTheme.headlineMedium),
                      ]),
                ),

                WidgetSpan(child: Container()),
                TextSpan(
                    text: 'Altura de la rodilla en cm\n ',
                    style: Theme.of(context).textTheme.titleMedium),
                TextSpan(
                    text: 'Talla en el hombre (cm):\n ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text:
                        ' 64,19 - (0,04 x edad) + (2,02 x altura de la rodilla)',
                    style: MyTheme().displaySmall),
                TextSpan(
                    text: '\n Talla en la mujer (cm):\n ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text:
                        ' 84,88 - (0,24 x edad) + (1,83 x altura de la rodilla)',
                    style: MyTheme()
                        .displaySmall //Theme.of(context).textTheme.displaySmall,
                    ),

                TextSpan(
                    text: '\nLongitud rodilla-maléolo externo (cm)\n ',
                    style: Theme.of(context).textTheme.titleMedium),
                TextSpan(
                    text: 'Talla en el hombre (cm):\n ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text:
                        ' [LRM (cm) x 1,121] - [0,117 x edad (años)] +119,6 )',
                    style: MyTheme().displaySmall),
                TextSpan(
                    text: '\n Talla en la mujer (cm):\n ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text:
                        ' [LRM (cm) x 1,263] - [0,159 x edad (años)] + 107,7 )',
                    style: MyTheme().displaySmall),

                //Semienvergadura
                TextSpan(
                    text: '\nSemienvergadura\n ',
                    style: Theme.of(context).textTheme.titleMedium),
                TextSpan(
                    text: 'Altura en cm para mujeres:\n ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: ' (1,35 x media envergadura) + 60,1',
                    style: MyTheme().displaySmall),
                TextSpan(
                    text: '\n Altura en cm para hombres:\n ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: ' (1,40 x media envergadura) + 57,8)',
                    style: MyTheme().displaySmall),
                //IMC
                WidgetSpan(child: Container()),
                WidgetSpan(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('IMC ',
                            style: Theme.of(context).textTheme.headlineMedium),
                      ]),
                ),

                TextSpan(
                    text: '\nPeso en Kg, Talla en metros: ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(text: ' Peso / Talla²', style: MyTheme().displaySmall),

                //CIMPLEXIÓN CORPORAL
                WidgetSpan(child: Container()),
                WidgetSpan(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('COMPLEXIÓN ',
                            style: Theme.of(context).textTheme.headlineMedium),
                      ]),
                ),
                TextSpan(
                    text: '\nTalla y circunferencia en cm: ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: ' talla / circunferencia',
                    style: MyTheme().displaySmall),
                //COMPOSICIÓN
                WidgetSpan(child: Container()),
                WidgetSpan(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('COMPOSICIÓN ',
                            style: Theme.of(context).textTheme.headlineMedium),
                      ]),
                ),

                TextSpan(
                    text: '\nFórmula de Yuhasz\n ',
                    style: Theme.of(context).textTheme.titleMedium),
                TextSpan(
                    text: '% graso ara hombres (pliegues en mm) ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: '\n3,64 + (suma de los 6 pliegues x 0.097)',
                    style: MyTheme().displaySmall),
                TextSpan(
                    text: '\n% graso ara mujeres (pliegues en mm)\n ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: '4,56 + (suma de los 6 pliegues x 0.143)',
                    style: MyTheme().displaySmall),

                //Indicador de sobrepeso
                TextSpan(
                    text: '\nÍndice cintura-cadera ',
                    style: Theme.of(context).textTheme.titleMedium),
                TextSpan(
                    text: '\nIAC = CCa/CCc ',
                    style: MyTheme().displaySmall),
                TextSpan(
                    text: '\nIAC: Índice abdomen-cadera',
                    style: MyTheme().displaySmall),
                TextSpan(
                    text: '\nCCa: Circunferencia del abdomen (cm) ',
                    style: MyTheme().displaySmall),
                TextSpan(
                    text: '\nCCc: circunferencia de la cadera (cm)',
                    style: MyTheme().displaySmall),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarMain(
        currentPageIndex: 1,
        isTablet: kIsWeb,
      ),
    );
  }
}
