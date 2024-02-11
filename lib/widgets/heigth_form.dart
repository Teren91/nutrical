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
  double _height = 0;
  bool isFemale = true;

  double _imc = 0;
  String _imcStatus = '';

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
                width: widthComponent * 0.2,
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
                    return 'Please enter some text';
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
              // Text(
              //   'Talla: $_height',
              //   style: Theme.of(context).textTheme.headlineLarge,
              // ),
              // ALTURA
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.ballot),
                    //suffixIcon: const Icon(Icons.clear),
                    labelText: 'Altura',
                    //filled: true,
                    border: const OutlineInputBorder(),
                    constraints: BoxConstraints(
                        maxHeight: heightComponent * 0.08,
                        maxWidth: widthComponent * 0.4)),
                keyboardType: TextInputType.number,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: _heightController,
                onTap: () {},
              ),
              const SizedBox(width: 12),
              // PESO
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.ballot),
                    //suffixIcon: const Icon(Icons.clear),
                    labelText: 'Peso',
                    //filled: true,
                    border: const OutlineInputBorder(),
                    constraints: BoxConstraints(
                        maxHeight: heightComponent * 0.08,
                        maxWidth: widthComponent * 0.4)),
                keyboardType: TextInputType.number,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: _weightController,
                onTap: () {},
              ),
              const SizedBox(height: 18),
            ],
          ),
          const SizedBox(height: 18),
          // DATOS PRECALCULADOS
          Row(
            children: [
              Text(
                'IMC: $_imc',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                ' $_imcStatus',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          DataTable(
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
                if (_formKey.currentState!.validate()) {
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
                    _height = double.parse(_height.toStringAsFixed(2));
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Introduce una edad y una altura')),
                  );
                }

                if (_heightController.text.isNotEmpty &&
                    _weightController.text.isNotEmpty) {
                  setState(() {
                    _imc = double.parse(getIMC(
                            double.parse(_weightController.text),
                            double.parse(_heightController.text))
                        .toStringAsFixed(2));
                    _imcStatus = getIMCStatus(_imc);
                  });
                }
              },
              child: const Text('Calcular'),
            ),
          ),
          Image.asset(
            'assets/images/tallaje.png',
            width: widthComponent,
            //height: heightComponent * 0.5,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
