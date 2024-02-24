import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.width,
    this.height,
    this.icon,
    this.onChanged,
    this.controller,
  }) ;

  final TextEditingController? controller;
  final String label;
  final String hintText;
  final double? width;
  final double? height;
  final Icon? icon;
  final Function(String)? onChanged;

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
        controller: controller,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
      ),
    );
  }
}
