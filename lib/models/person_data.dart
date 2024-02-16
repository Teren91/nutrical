
import 'package:flutter/material.dart';

class PersonData with ChangeNotifier{

  int _age = 0;
  double _weight = 0;
  double _height = 0;
  double _imc = 0;

  void setData(int age, double weight, double height, double imc)
  {
    _age = age;
    _weight = weight;
    _height = height;
    _imc = imc;
    notifyListeners();
  }

  set setAge(int age) => _age = age;
  set setWeight(double weight) => _weight = weight;
  set setHeight(double height) => _height = height;
  set setImc(double imc) => _imc = imc;
  
  get getAge => _age;
  get getWeight => _weight;
  get getHeight => _height;
  get getImc => _imc;


}