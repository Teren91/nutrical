import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required TextEditingController lrmController,
    required this.label,
    required this.hintText,
    this.width,
    this.height,
    this.icon
  }) : _lrmController = lrmController;

  final TextEditingController _lrmController;
  final String label;
  final String hintText;
  final double? width;
  final double? height;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText:label,
          prefixIcon: icon,
          constraints: BoxConstraints( 
            maxHeight: height ?? 50,
            maxWidth: width ?? 300,
            
          ),
        ),
        
        controller: _lrmController,
        keyboardType: TextInputType.number,
        //// The validator receives the text that the user has entered.
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return '*Campo obligatorio';
        //   }
        //   return null;
        // },
        // controller: _ageController,
        // onTap: () {},
      ),
    );
  }
}
