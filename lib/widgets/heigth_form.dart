// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:nutrical/utils/constants.dart';
import 'package:nutrical/utils/functions.dart';

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
  double _height = 0;
  bool isFemale = true;
  bool _showTable = false;

  double _imc = 0;
  String _imcStatus = '';
  double _bodyComplexion = 0;

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
                value: isFemale,
                thumbIcon: thumbIcon,
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveThumbColor: Theme.of(context).colorScheme.primary,
                activeTrackColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.5),
                inactiveTrackColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.5),
                //inactiveThumbImage: Icon(Icons.thumb_up),
                onChanged: (bool value) {
                  _changeGender(value);
                },
              ),
              Text(
                'F',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                width: widthComponent * 0.1,
              ),
              //EDAD
              const SizedBox(width: 12),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    //suffixIcon: const Icon(Icons.clear),
                    labelText: 'Edad',
                    //filled: true,
                    border: const OutlineInputBorder(),
                    constraints: BoxConstraints(
                        maxHeight: heightComponent * 0.08,
                        maxWidth: widthComponent * 0.4)),
                keyboardType: TextInputType.number,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Campo obligatorio';
                  }
                  return null;
                },
                controller: _ageController,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              // ALTURA
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.ballot),
                    labelText: "Altura",
                    border: const OutlineInputBorder(),
                    constraints: BoxConstraints(
                        maxHeight: heightComponent * 0.08,
                        maxWidth: widthComponent * 0.4)),
                keyboardType: TextInputType.number,
                // The validator receives the text that the user has entered.
                // validator: validateHeigth,
                // onSaved: (value) {
                //   _heightController = value;
                // },
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
                //  validator: validateWeigth,
                // onSaved: (value) {
                //   _weightController = value;
                // },
                controller: _weightController,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 18),

          // DATOS PRECALCULADOS
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ElevatedButton(
            onPressed: () {
              //if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              if (_heightController.text.isNotEmpty &&
                  _weightController.text.isNotEmpty) {
                setState(() {
                  _imc = double.parse(getIMC(
                          double.parse(formatDecimal(_weightController.text)),
                          double.parse(_heightController.text))
                      .toStringAsFixed(2));
                  _imcStatus = getIMCStatus(_imc);
                });
                // }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Introduce una altura y un peso')),
                );
              }
              //  }
            },
            child: const Text('Calcular IMC'),
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

          const SizedBox(height: 18),

          //Altura rodilla
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Altura en cm',
              labelText: 'Altura de rodilla',
            ),
            controller: _arController,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Longitud en cm',
              labelText: 'Altura rodilla-maléolo externo',
            ),
            controller: _lrmController,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Longitud en cm',
              labelText: 'Altura por envergadura',
            ),
            controller: _wingSpanController,
            keyboardType: TextInputType.number,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                //  if (_formKey.currentState!.validate()) {
                if (_ageController.text.isEmpty) {
                  _heightController.text = '';
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Introduce una una edad')),
                  );
                } else {
                  _formKey.currentState!.save();
                  if (_arController.text.isNotEmpty) {
                    _height = getHeight(
                        isFemale,
                        int.parse(_ageController.text),
                        int.parse(_arController.text));
                  } else if (_lrmController.text.isNotEmpty) {
                    _height = getHeightLRM(
                        isFemale,
                        int.parse(_ageController.text),
                        int.parse(_lrmController.text));
                  } else if (_wingSpanController.text.isNotEmpty) {
                    _height = getHeightWingSpan(
                        isFemale, int.parse(_wingSpanController.text));
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
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //         content: Text('Introduce una edad y una altura')),
                //   );
                // }
              },
              child: const Text('Calcular Altura'),
            ),
          ),
          // Image.asset(
          //   'assets/images/tallaje.png',
          //   width: widthComponent,
          //   //height: heightComponent * 0.5,
          //   fit: BoxFit.fill,
          // ),

          Text(
            'Complexión corporal: $_bodyComplexion' ,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 12,),
          TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.ballot),
                    labelText: 'Circunferencia de muñeca',
                    border: const OutlineInputBorder(),
                    constraints: BoxConstraints(
                        maxHeight: heightComponent * 0.08,
                        maxWidth: widthComponent * 0.4)),
                keyboardType: TextInputType.number,
                controller: _wristCircumference,
                onTap: () {},
              ),
              const SizedBox(height: 12,),
            ElevatedButton(
            onPressed: () {
              //if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              if (_heightController.text.isNotEmpty &&
                  _wristCircumference.text.isNotEmpty) {
                setState(() {
                  _bodyComplexion = double.parse(getBodComplexion(
                        double.parse(_heightController.text), 
                        double.parse(_wristCircumference.text)
                    ).toStringAsFixed(2));
                });
                // }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Introduce una altura y un circunferencia de muñeca')),
                );
              }
              //  }
            },
            child: const Text('Calcular Complexión'),
          ),
        ],
      ),
    );
  }
}
