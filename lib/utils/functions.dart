import 'package:nutrical/utils/constants.dart';

double getHeight(bool isFamele, int age, int ar) {
  if (isFamele) {
    return 84.88 - (0.24 * age) + (1.83 * ar);
  } else {
    return 64.19 - (0.04 * age) + (2.02 * ar);
  }
}

double getHeightLRM(bool isFamele, int age, int lrm) {
  if (isFamele) {
    return (lrm * 1.263) - (0.159 * age) + 107.7;
  } else {
    return (lrm * 1.121) - (0.117 * age) + 119.6;
  }
}

double getHeightWingSpan(bool isFamele, int wingSpan) {
  if (isFamele) {
    return (1.35 * wingSpan) + 60.1;
  } else {
    return (1.4 * wingSpan) + 57.8;
  }
}

double getIMC(double weight, double height) {
  height = height / 100; //Formatear el peso para que llegue con decimales
  return weight / (height * height);
}

String getIMCStatus(double imc) {
  if (imc < 18.5) {
    return imcTable.keys.first;
  } else if (imc < 24.9) {
    return imcTable.keys.elementAt(1);
  } else if (imc < 26.9) {
    return imcTable.keys.elementAt(2);
  } else if (imc < 29.9) {
    return imcTable.keys.elementAt(3);
  } else if (imc < 34.9) {
    return imcTable.keys.elementAt(4);
  } else if (imc < 39.9) {
    return imcTable.keys.elementAt(5);
  } else if (imc < 49.9) {
    return imcTable.keys.elementAt(6);
  } else {
    return imcTable.keys.elementAt(7);
  }
}

String formatDecimal(String text)
{
  return text.replaceAll(',', '.');
}

double getBodyComplexion(double heigth, double wristCircumference)
{
  return heigth / wristCircumference;
}

String getBodyComplexionStatus(bool isFemale, double bodyComplexion)
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


double getYuhasz(bool isFemale, int fold1, int fold2, int fold3, int fold4,
  int fold5, int fold6 )
{
  if(isFemale)
  {
    return 4.56 + ((fold1 + fold2 + fold3 + fold4 + fold5 + fold6) * 0.143);
  }else{
    return 3.64 + ((fold1 + fold2 + fold3 + fold4 + fold5 + fold6) * 0.097);
  }
}

double getIndexHipWaist(double hip, double waist)
{
  return hip/waist;
}