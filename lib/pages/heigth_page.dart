import 'package:flutter/material.dart';
import 'package:nutrical/utils/constants.dart';
import 'package:nutrical/widgets/widgets.dart';

class HeigthPage extends StatefulWidget {
  const HeigthPage({super.key, required this.title});

  final String title;
  @override
  State<HeigthPage> createState() => _HeigthPageState();
}

class _HeigthPageState extends State<HeigthPage> {
  @override
  Widget build(BuildContext context) {
    double widthComponent = MediaQuery.of(context).size.width;

    return widthComponent < tabletWidth 
      ? HeigthForm(title: widget.title) 
      : HeigthFormTablet(title: widget.title,);
  }
}