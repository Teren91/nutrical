// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:nutrical/utils/constants.dart';
import 'package:nutrical/utils/functions.dart';

import 'text_form_field_widget.dart';

class HeigthForm extends StatefulWidget {
  const HeigthForm({super.key});

  @override
  HeigthFormState createState() {
    return HeigthFormState();
  }
}

class HeigthFormState extends State<HeigthForm> {
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
  final int _fold1 = 0;
  final int _fold2 = 0;
  final int _fold3 = 0;
  final int _fold4 = 0;
  final int _fold5 = 0;
  final int _fold6 = 0;

  double _iac = 0; //Index abdomen-hips

  void _changeGender(bool value) {
    setState(() {
      _isFemale = value;
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

  String? validateHeigth(String? value) {
    if (value == null || value.isEmpty) {
      return '*Campo obligatorio';
    }

    // if (value != null && value.isNotEmpty) {
    if (int.tryParse(value) == null) {
      return 'Formato: 160';
      // }
    }
    return null;
  }

  String? validateWeigth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  // void updateIMC(double weight, double height) {
  //   if (_weightController.text.isNotEmpty &&
  //         _heightController.text.isNotEmpty) {
  //     setState(() {
  //       _imc = double.parse(getIMC(weight, height).toStringAsFixed(2));
  //       _imcStatus = getIMCStatus(_imc);
  //     });
  //   }
  // }

   void updateIMC() {
    if (_weightController.text.isNotEmpty &&
          _heightController.text.isNotEmpty) {
      setState(() {
        _imc = double.parse(getIMC(
            double.parse(_weightController.text), 
            double.parse(_heightController.text)).toStringAsFixed(2));
        _imcStatus = getIMCStatus(_imc);
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
        _height = getHeight(_isFemale, int.parse(_ageController.text),
            int.parse(_arController.text));
      } else if (_lrmController.text.isNotEmpty) {
        _height = getHeightLRM(_isFemale, int.parse(_ageController.text),
            int.parse(_lrmController.text));
      } else if (_wingSpanController.text.isNotEmpty) {
        _height =
            getHeightWingSpan(_isFemale, int.parse(_wingSpanController.text));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Introduce una altura')),
        );
      }
      setState(() {
        //_height = double.parse(_height.toStringAsFixed(2));
        _heightController.text = _height.toInt().toString();
      });
    }
  }

  void updateBodyComplexity() {
    //if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();

    if (_heightController.text.isNotEmpty &&
        _wristCircumference.text.isNotEmpty) {
      setState(() {
        _bodyComplexion = double.parse(getBodyComplexion(
                double.parse(_heightController.text),
                double.parse(_wristCircumference.text))
            .toStringAsFixed(2));
      });
      // }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Introduce una altura y un circunferencia de muñeca')),
      );
    }
  }

  void updateBodyComposition() {
    setState(() {
      if (_waistCircunference.text.isNotEmpty &&
          _hipsCircumference.text.isNotEmpty) {
        _iac = double.parse(getIndexHipWaist(
                double.parse(_hipsCircumference.text),
                double.parse(_waistCircunference.text))
            .toStringAsFixed(2));
      }
    });
  }

  void updateBodyCompositionYuhasz() {
    setState(() {
      _bodyComposition = double.parse(
          getYuhasz(_isFemale, _fold1, _fold2, _fold3, _fold4, _fold5, _fold6)
              .toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthComponent = MediaQuery.of(context).size.width;
    double heightComponent = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                inactiveThumbColor: Theme.of(context).colorScheme.primary,
                activeTrackColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.5),
                inactiveTrackColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.5),
                //inactiveThumbImage: Icon(Icons.thumb_up),
                onChanged: (bool value) => _changeGender(value),
              ),
              Text(
                'F',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                width: widthComponent * 0.1,
              ),
              //EDAD
              const SizedBox(width: 14),
              TextFormFieldWidget(
                lrmController: _ageController,
                label: 'Edad',
                hintText: 'Longitud en cm',
                width: widthComponent * 0.4,
                height: heightComponent * 0.08,
                icon: const Icon(Icons.person),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              // ALTURA
              // TextFormFieldWidget(
              //     lrmController: _ageController,
              //     label: 'Altura',
              //     hintText: 'Longitud en cm',
              //     width: widthComponent * 0.4,
              //     height: heightComponent * 0.08,
              //     icon: const Icon(Icons.ballot)
              //   ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.ballot),
                    labelText: "Altura",
                    border: const OutlineInputBorder(),
                    constraints: BoxConstraints(
                        maxHeight: heightComponent * 0.08,
                        maxWidth: widthComponent * 0.4)),
                keyboardType: TextInputType.number,
                onChanged: (value) => updateIMC(
                   //double.parse(formatDecimal(_weightController.text)),
                    //double.parse(value)
                    ),
                controller: _heightController,
                onTap: () {},
              ),
              const SizedBox(width: 12),

              // PESO
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.ballot),
                    labelText: 'Peso',
                    border: const OutlineInputBorder(),
                    constraints: BoxConstraints(
                        maxHeight: heightComponent * 0.08,
                        maxWidth: widthComponent * 0.4)),
                keyboardType: TextInputType.number,
                // The validator receives the text that the user has entered.
                onChanged: (value) => updateIMC(
                    // double.parse(formatDecimal(value)),
                    // double.parse(_heightController.text)
                    ),
                controller: _weightController,
                onTap: () {},
              ),
            ],
          ),
          // const SizedBox(height: 18),

          // DATOS PRECALCULADOS
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          // ElevatedButton(
          //   onPressed: () {
          //     //if (_formKey.currentState!.validate()) {
          //     _formKey.currentState!.save();

          //     if (_heightController.text.isNotEmpty &&
          //         _weightController.text.isNotEmpty) {
          //       setState(() {
          //         _imc = double.parse(getIMC(
          //                 double.parse(formatDecimal(_weightController.text)),
          //                 double.parse(_heightController.text))
          //             .toStringAsFixed(2));
          //         _imcStatus = getIMCStatus(_imc);
          //       });
          //       // }
          //     } else {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         const SnackBar(
          //             content: Text('Introduce una altura y un peso')),
          //       );
          //     }
          //     //  }
          //   },
          //   child: const Text('Calcular IMC'),
          // ),
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
          TextFormFieldWidget(
              lrmController: _arController,
              label: 'Altura de rodilla',
              hintText: 'Altura en cm',
              icon: const Icon(Icons.ballot)),
          TextFormFieldWidget(
              lrmController: _lrmController,
              label: 'Altura rodilla-maléolo externo',
              hintText: 'Longitud en cm',
              icon: const Icon(Icons.ballot)),
          TextFormFieldWidget(
              lrmController: _wingSpanController,
              label: 'Altura por envergadura',
              hintText: 'Longitud en cm',
              icon: const Icon(Icons.ballot)),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              key: const ValueKey('btnCalculateHeigth'),
              onPressed: () => updateHeight(),
              child: const Text('Calcular Altura'),
            ),
          ),
          // Image.asset(
          //   'assets/images/tallaje.png',
          //   width: widthComponent,
          //   //height: heightComponent * 0.5,
          //   fit: BoxFit.fill,
          // ),

          //BODY COMPLEXION
          Text(
            'Complexión corporal: $_bodyComplexion',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.ballot),
              labelText: 'Circunferencia de muñeca',
              border: OutlineInputBorder(),
              // constraints: BoxConstraints(
              //     maxHeight: heightComponent * 0.08,
              //     maxWidth: widthComponent * 0.4)
            ),
            keyboardType: TextInputType.number,
            controller: _wristCircumference,
            onChanged: (value) => updateBodyComposition(),
          ),
          const SizedBox(
            height: 12,
          ),
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
                      lrmController: _fold1Controller,
                      label: 'Tríceps',
                      hintText: 'Longitud en mm',
                      width: widthComponent * 0.4,
                      height: heightComponent * 0.08,
                    ),
                    const SizedBox(width: 12),
                    TextFormFieldWidget(
                      lrmController: _fold2Controller,
                      label: 'Subescapular',
                      hintText: 'Longitud en mm',
                      width: widthComponent * 0.4,
                      height: heightComponent * 0.08,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextFormFieldWidget(
                      lrmController: _fold3Controller,
                      label: 'Suprailíaco',
                      hintText: 'Longitud en mm',
                      width: widthComponent * 0.4,
                      height: heightComponent * 0.08,
                    ),
                    const SizedBox(width: 12),
                    TextFormFieldWidget(
                      lrmController: _fold4Controller,
                      label: 'Abdominal',
                      hintText: 'Longitud en mm',
                      width: widthComponent * 0.4,
                      height: heightComponent * 0.08,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextFormFieldWidget(
                      lrmController: _fold5Controller,
                      label: 'Pliege muslo anterior',
                      hintText: 'Longitud en mm',
                      width: widthComponent * 0.4,
                      height: heightComponent * 0.08,
                    ),
                    const SizedBox(width: 12),
                    TextFormFieldWidget(
                      lrmController: _fold6Controller,
                      label: 'Pliege pierna',
                      hintText: 'Longitud en mm',
                      width: widthComponent * 0.4,
                      height: heightComponent * 0.08,
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
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.ballot),
                    labelText: 'abdomen circunferencia',
                    border: const OutlineInputBorder(),
                    constraints: BoxConstraints(
                        maxHeight: heightComponent * 0.08,
                        maxWidth: widthComponent * 0.4)),
                keyboardType: TextInputType.number,
                controller: _waistCircunference,
                onChanged: (value) => updateBodyComposition(),
              ),
              const SizedBox(width: 12),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.ballot),
                    labelText: 'cadera circunferencia',
                    border: const OutlineInputBorder(),
                    constraints: BoxConstraints(
                        maxHeight: heightComponent * 0.08,
                        maxWidth: widthComponent * 0.4)),
                keyboardType: TextInputType.number,
                controller: _hipsCircumference,
                onChanged: (value) => updateBodyComposition(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
