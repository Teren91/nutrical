
// Create a Form widget.
import 'package:flutter/material.dart';
import 'package:nutrical/utils/functions.dart';

class HeigthForm extends StatefulWidget {
  const HeigthForm({
    super.key, 
    required this.isFemale
  });

  final bool isFemale;

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
  double _height = 0;

  @override
  Widget build(BuildContext context) {
    double widthComponent = MediaQuery.of(context).size.width;
    double heightComponent = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Talla: $_height',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 18),
          //EDAD
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                suffixIcon: const Icon(Icons.clear),
                labelText: 'Edad',
                filled: true,
                constraints: BoxConstraints(
                    maxHeight: heightComponent * 0.08,
                    maxWidth: widthComponent * 0.5)),
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

          //Altura rodilla
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Altura en cm',
              labelText: 'Altura de rodilla',
            ),
            controller: _arController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Longitud en cm',
              labelText: 'Altura rodilla-maléolo externo',
            ),
            controller: _lrmController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Longitud en cm',
              labelText: 'Altura por envergadura',
            ),
            controller: _wingSpanController,
          ),
         
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  if (_arController.text.isNotEmpty) {
                    _height = getHeight(widget.isFemale, int.parse(_ageController.text),
                        int.parse(_arController.text));
                  } else if (_lrmController.text.isNotEmpty) {
                    _height = getHeightLRM(widget.isFemale, int.parse(_ageController.text),
                        int.parse(_lrmController.text));
                  } else if (_wingSpanController.text.isNotEmpty) {
                    _height = getHeightWingSpan(
                        widget.isFemale, int.parse(_wingSpanController.text));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Introduce una altura')),
                    );
                  }
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text( (_height).toString())),
                  // );
                  setState(() {
                    _height = double.parse(_height.toStringAsFixed(2));
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Introduce una edad y una altura')),
                  );
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