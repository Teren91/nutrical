import 'package:flutter/material.dart';
import 'package:nutrical/utils/constants.dart';
import 'package:nutrical/widgets/widgets.dart';

class FormulaPage extends StatefulWidget {
  const FormulaPage({super.key, required this.title});

  final String title;

  @override
  State<FormulaPage> createState() => _FormulaPageState();
}

class _FormulaPageState extends State<FormulaPage> {

  @override
  Widget build(BuildContext context) {
    double widthComponent = MediaQuery.of(context).size.width;

    return widthComponent < tabletWidth 
      ? FormulaForm(title: widget.title) 
      : FormulaFormTablet(title: widget.title,);
  }
}
