import 'package:flutter/material.dart';
import 'package:nutrical/models/person_data.dart';
import 'package:nutrical/utils/functions.dart';
import 'package:provider/provider.dart';

class CalculateWidget extends StatefulWidget {
  const CalculateWidget({super.key});


  @override
  State<CalculateWidget> createState() => _CalculateWidgetState();
}

class _CalculateWidgetState extends State<CalculateWidget> {
  
  @override
  Widget build(BuildContext context) {

    final personData = Provider.of<PersonData>(context, listen: false);
    

    return ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
            //   if (_formKey.currentState!.validate()) {
            //     if (_arController.text.isNotEmpty) {
            //       _height = getHeight(
            //           isFemale,
            //           int.parse(_ageController.text),
            //           int.parse(_arController.text));
            //     } else if (_lrmController.text.isNotEmpty) {
            //       _height = getHeightLRM(
            //           isFemale,
            //           int.parse(_ageController.text),
            //           int.parse(_lrmController.text));
            //     } else if (_wingSpanController.text.isNotEmpty) {
            //       _height = getHeightWingSpan(
            //           isFemale, int.parse(_wingSpanController.text));
            //     } else {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(content: Text('Introduce una altura')),
            //       );
            //     }
            //     setState(() {
            //       _height = double.parse(_height.toStringAsFixed(2));
            //     });
            //   } else {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(
            //           content: Text('Introduce una edad y una altura')),
            //     );
            //   }
          
            //   if (_heightController.text.isNotEmpty &&
            //       _weightController.text.isNotEmpty) {
            //     setState(() {
            //       _imc = double.parse(getIMC(
            //               double.parse(_weightController.text),
            //               double.parse(_heightController.text))
            //           .toStringAsFixed(2));
            //       _imcStatus = getIMCStatus(_imc);
            //     });
            //   }

             
                personData.setImc = double.parse(getIMC(
                        personData.getWeight,
                        personData.getHeight)
                    .toStringAsFixed(2));
              

             },
             style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              minimumSize: MaterialStateProperty.all(const Size(200, 50)),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            child: const Text('Calcular'),
           
          );
  }
}