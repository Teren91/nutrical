import 'package:nutrical/utils/constants.dart';

abstract class BodyComplexionCalculator {
  calculateBodyComplexion(double heigth, double wristCircumference);
}

abstract class BodyComplexionStatusCalculator {
  calculateBodyComplexion(bool isFemale, double bodyComplexion);
}


class DefaultComplexionCalculator implements BodyComplexionCalculator {
  @override
  double calculateBodyComplexion(double heigth, double wristCircumference) {
    return heigth / wristCircumference;
  }
}

class DefaultComplexionStatusCalculator implements BodyComplexionStatusCalculator{

  @override
  String calculateBodyComplexion(bool isFemale, double bodyComplexion)
  {
    if (isFemale){
    if(bodyComplexion < 9.6){
      return bodyComplexionTable[0].elementAt(0);
    }else if(bodyComplexion < 10.4){
      return bodyComplexionTable[1].elementAt(0);
    }else{
      return bodyComplexionTable[2].elementAt(0);
    }
  }else{
    if(bodyComplexion < 10.1){
      return bodyComplexionTable[0].elementAt(0);
    }else if(bodyComplexion < 11){
      return bodyComplexionTable[1].elementAt(0);
    }else{
      return bodyComplexionTable[2].elementAt(0);
    }
  }
  }

}