// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:nutrical/domain/usecases/body_complexion.dart';
import 'package:nutrical/domain/usecases/body_composition.dart';
import 'package:nutrical/domain/usecases/heigth_calculator.dart';
import 'package:nutrical/domain/usecases/imc_calculator.dart';
import 'package:nutrical/utils/constants.dart';
import 'package:nutrical/widgets/navigation_bar.dart';

import 'text_form_field_widget.dart';

class HeigthFormTablet extends StatefulWidget {
  const HeigthFormTablet({super.key, required this.title});

  final String title;

  @override
  HeigthFormTabletState createState() {
    return HeigthFormTabletState();
  }
}

class HeigthFormTabletState extends State<HeigthFormTablet> {
  HeigthFormTabletState();

  final IMCCalculator imcCalculator = DefaultIMCCalculator();
  final IMCStatusCalculator imcStatusCalculator = DefaultIMCStatusCalculator();
  final BodyCompositionCalculator bodyCompositionCalculator =
      DefaultBodyCompositionCalculator();
  final BodyComplexionCalculator bodyComplexionCalculator =
      DefaultComplexionCalculator();

  final HeigthCalculator heigthCalculator = DefaultHeigthCalculator();

  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _arController = TextEditingController();
  final _lrmController = TextEditingController();
  final _wingSpanController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _wristCircumference = TextEditingController();

  final _fold1Controller = TextEditingController();
  final _fold2Controller = TextEditingController();
  final _fold3Controller = TextEditingController();
  final _fold4Controller = TextEditingController();
  final _fold5Controller = TextEditingController();
  final _fold6Controller = TextEditingController();

  final _waistCircunference = TextEditingController();
  final _hipsCircumference = TextEditingController();

  double _height = 0;
  bool _isFemale = true;
  bool _showTable = false;
  //Body complexion
  bool _showBCTable = false;

  double _imc = 0;
  String _imcStatus = '';
  double _bodyComplexion = 0;
  double _bodyComposition = 0;

  bool _showFolds = false;
  double _iac = 0; //Index abdomen-hips

  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Fórmulas'),
    const BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
  ];

  void _changeGender(bool value) {
    setState(() {
      _isFemale = value;
    });
  }

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      return const Icon(Icons.check);
    },
  );

  String? validateHeigth(String? value) {
    if (value == null || value.isEmpty) {
      return '*Campo obligatorio';
    }

    if (int.tryParse(value) == null) {
      return 'Formato: 160';
    }
    return null;
  }

  String? validateWeigth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  void updateIMC(String? value) {
    if (_weightController.text.isNotEmpty &&
        _heightController.text.isNotEmpty) {
      setState(() {
        double formatHeigth = double.parse(_heightController.text) / 100;

        _imc = imcCalculator.calculateIMC(
            double.parse(_weightController.text), formatHeigth);
        _imc = double.parse(_imc.toStringAsFixed(2));
        _imcStatus = imcStatusCalculator.getIMCStatus(_imc);
      });
    }
  }

  void updateHeight() {
    if (_ageController.text.isEmpty) {
      _heightController.text = '';
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Introduce una una edad')),
      );
    } else {
      _formKey.currentState!.save();
      if (_arController.text.isNotEmpty) {
        _height = heigthCalculator.calculateKneeHeight(_isFemale,
            int.parse(_ageController.text), int.parse(_arController.text));
      } else if (_lrmController.text.isNotEmpty) {
        _height = heigthCalculator.calculatelengthKneeMalleolusHeigth(_isFemale,
            int.parse(_ageController.text), int.parse(_lrmController.text));
      } else if (_wingSpanController.text.isNotEmpty) {
        _height = heigthCalculator
            .calculateWingSpanHeigth(int.parse(_wingSpanController.text));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Introduce una altura')),
        );
      }
      setState(() {
        _heightController.text = _height.toInt().toString();
        updateIMC(null);
      });
    }
  }

  void updateBodyComplexity() {
    _formKey.currentState!.save();

    if (_heightController.text.isNotEmpty &&
        _wristCircumference.text.isNotEmpty) {
      setState(() {
        _bodyComplexion = bodyComplexionCalculator
            .calculateBodyComplexion(double.parse(_heightController.text),
                double.parse(_wristCircumference.text))
            .toStringAsFixed(2);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Introduce una altura y un circunferencia de muñeca')),
      );
    }
  }

  void updateBodyComposition(String? value) {
    setState(() {
      if (_waistCircunference.text.isNotEmpty &&
          _hipsCircumference.text.isNotEmpty) {
        _iac = bodyCompositionCalculator
            .calculateIndexHipWaist(double.parse(_hipsCircumference.text),
                double.parse(_waistCircunference.text))
            .toStringAsFixed(2);
      }
    });
  }

  void updateBodyCompositionYuhasz() {
    setState(() {
      _bodyComposition = bodyCompositionCalculator
          .calculateYuhasz(
              _isFemale,
              int.parse(_fold1Controller.text),
              int.parse(_fold2Controller.text),
              int.parse(_fold3Controller.text),
              int.parse(_fold4Controller.text),
              int.parse(_fold5Controller.text),
              int.parse(_fold6Controller.text))
          .toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthComponent = MediaQuery.of(context).size.width;
    double heightComponent = MediaQuery.of(context).size.height;
    double tabletWidthMultiplier = 0.25;
    double tabletHeigthMultiplier = 0.1;
    int currentPageIndex = 0;

    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: <Widget>[
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Text(
                          'M',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Switch(
                          value: _isFemale,
                          thumbIcon: thumbIcon,
                          activeColor: Theme.of(context).colorScheme.primary,
                          inactiveThumbColor:
                              Theme.of(context).colorScheme.primary,
                          activeTrackColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                          inactiveTrackColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                          //inactiveThumbImage: Icon(Icons.thumb_up),
                          onChanged: (bool value) => _changeGender(value),
                        ),
                        Text(
                          'F',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          width: widthComponent * 0.05,
                        ),
                        //EDAD
                        const SizedBox(width: 14),
                        TextFormFieldWidget(
                          label: 'Edad',
                          hintText: 'Longitud en cm',
                          width: widthComponent * tabletWidthMultiplier,
                          height: heightComponent * tabletHeigthMultiplier,
                          icon: const Icon(Icons.person),
                          controller: _ageController,
                        ),
                        const SizedBox(width: 12),
                        TextFormFieldWidget(
                          label: 'Altura',
                          hintText: 'Longitud en cm',
                          width: widthComponent * tabletWidthMultiplier,
                          height: heightComponent * tabletHeigthMultiplier,
                          icon: const Icon(Icons.ballot),
                          onChanged: updateIMC,
                          controller: _heightController,
                        ),
                        const SizedBox(width: 12),

                        // PESO
                        TextFormFieldWidget(
                          label: 'Peso',
                          hintText: 'Peso',
                          icon: const Icon(Icons.ballot),
                          width: widthComponent * tabletWidthMultiplier,
                          height: heightComponent * tabletHeigthMultiplier,
                          onChanged: updateIMC,
                          controller: _weightController,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    // DATOS PRECALCULADOS
                    Column(
                      children: [
                        Text(
                          'IMC: $_imc',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          ' $_imcStatus',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),

                    OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showTable = !_showTable;
                        });
                      },
                      label: const Text(
                        'Mostrar/Ocultar tabla IMC',
                      ),
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                    Visibility(
                      visible: _showTable,
                      child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(label: Text('IMC')),
                            DataColumn(
                              label: Text('Clasificación'),
                            )
                          ],
                          rows: imcTable.entries
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(e.key)),
                                    DataCell(Text(e.value.toString())),
                                  ]))
                              .toList()),
                    ),

                    const SizedBox(height: 12),

                    //Altura rodilla
                    Row(
                      children: [
                        TextFormFieldWidget(
                          controller: _arController,
                          label: 'Altura de rodilla',
                          hintText: 'Altura en cm',
                          icon: const Icon(Icons.ballot),
                          width: widthComponent * tabletWidthMultiplier,
                          height: heightComponent * tabletHeigthMultiplier,
                        ),
                        const SizedBox(width: 12),
                        TextFormFieldWidget(
                          controller: _lrmController,
                          label: 'Altura rodilla-maléolo externo',
                          hintText: 'Longitud en cm',
                          icon: const Icon(Icons.ballot),
                          width: widthComponent * tabletWidthMultiplier,
                          height: heightComponent * tabletHeigthMultiplier,
                        ),
                        const SizedBox(width: 12),
                        TextFormFieldWidget(
                          controller: _wingSpanController,
                          label: 'Altura por envergadura',
                          hintText: 'Longitud en cm',
                          icon: const Icon(Icons.ballot),
                          width: widthComponent * tabletWidthMultiplier,
                          height: heightComponent * tabletHeigthMultiplier,
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        key: const ValueKey('btnCalculateHeigth'),
                        onPressed: () => updateHeight(),
                        child: const Text('Calcular Altura'),
                      ),
                    ),

                    //BODY COMPLEXION
                    Text(
                      'Complexión corporal: $_bodyComplexion',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    TextFormFieldWidget(
                      label: 'Muñeca circunferencia',
                      hintText: 'Longitud en mm',
                      icon: const Icon(Icons.ballot),
                      width: widthComponent * tabletWidthMultiplier,
                      height: heightComponent * tabletHeigthMultiplier,
                      onChanged: updateBodyComposition,
                      controller: _wristCircumference,
                    ),

                    const SizedBox(height: 12),

                    ElevatedButton(
                      onPressed: () => updateBodyComplexity(),
                      child: const Text('Calcular Complexión'),
                    ),
                    const SizedBox(height: 19),

                    OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showBCTable = !_showBCTable;
                        });
                      },
                      label: const Text(
                        'Mostrar/Ocultar tabla Complexión corporal',
                      ),
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                    Visibility(
                      visible: _showBCTable,
                      child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(label: Text('Complexión')),
                            DataColumn(
                              label: Text('Mujer'),
                            ),
                            DataColumn(
                              label: Text('Hombre'),
                            )
                          ],
                          rows: bodyComplexionTable
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(e[0].toString())),
                                    DataCell(Text(e[1].toString())),
                                    DataCell(Text(e[2].toString())),
                                  ]))
                              .toList()),
                    ),

                    const SizedBox(height: 18),

                    // BODY COMPOSITION
                    Text(
                      'Composición corporal: $_bodyComposition',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),

                    OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showFolds = !_showFolds;
                        });
                      },
                      label: const Text(
                        'Mostrar/Ocultar Pliegues',
                      ),
                      icon: const Icon(Icons.arrow_drop_down),
                    ),

                    //FOLDS
                    Visibility(
                      visible: _showFolds,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextFormFieldWidget(
                                label: 'Tríceps',
                                hintText: 'Longitud en mm',
                                width: widthComponent * tabletWidthMultiplier,
                                height:
                                    heightComponent * tabletHeigthMultiplier,
                                controller: _fold1Controller,
                              ),
                              const SizedBox(width: 12),
                              TextFormFieldWidget(
                                label: 'Subescapular',
                                hintText: 'Longitud en mm',
                                width: widthComponent * tabletWidthMultiplier,
                                height:
                                    heightComponent * tabletHeigthMultiplier,
                                controller: _fold2Controller,
                              ),
                              const SizedBox(width: 12),
                              TextFormFieldWidget(
                                label: 'Suprailíaco',
                                hintText: 'Longitud en mm',
                                width: widthComponent * tabletWidthMultiplier,
                                height:
                                    heightComponent * tabletHeigthMultiplier,
                                controller: _fold3Controller,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextFormFieldWidget(
                                label: 'Abdominal',
                                hintText: 'Longitud en mm',
                                width: widthComponent * tabletWidthMultiplier,
                                height:
                                    heightComponent * tabletHeigthMultiplier,
                                controller: _fold4Controller,
                              ),
                              const SizedBox(width: 12),
                              TextFormFieldWidget(
                                label: 'Pliege muslo anterior',
                                hintText: 'Longitud en mm',
                                width: widthComponent * tabletWidthMultiplier,
                                height:
                                    heightComponent * tabletHeigthMultiplier,
                                controller: _fold5Controller,
                              ),
                              const SizedBox(width: 12),
                              TextFormFieldWidget(
                                label: 'Pliege pierna',
                                hintText: 'Longitud en mm',
                                width: widthComponent * tabletWidthMultiplier,
                                height:
                                    heightComponent * tabletHeigthMultiplier,
                                controller: _fold6Controller,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => updateBodyCompositionYuhasz(),
                      child: const Text('Calcular Composición'),
                    ),
                    const SizedBox(height: 19),

                    // INDEX HIP-WAIST
                    Text(
                      'Índice cintura-Cadera: $_iac',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        TextFormFieldWidget(
                          label: 'Abdomen circunferencia',
                          hintText: 'Longitud en cm',
                          width: widthComponent * tabletWidthMultiplier,
                          height: heightComponent * tabletHeigthMultiplier,
                          onChanged: updateBodyComposition,
                          controller: _waistCircunference,
                        ),
                        const SizedBox(width: 12),
                        TextFormFieldWidget(
                          label: 'Cadera circunferencia',
                          hintText: 'Longitud en cm',
                          width: widthComponent * tabletWidthMultiplier,
                          height: heightComponent * tabletHeigthMultiplier,
                          onChanged: updateBodyComposition,
                          controller: _hipsCircumference,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ][currentPageIndex],
        bottomNavigationBar: NavigationBarMain(
          currentPageIndex: currentPageIndex,
          isTablet: widthComponent > 600 ? true : false,
        ),
      ),
    );
  }
}
