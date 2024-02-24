// Interfaz para el cálculo del IMC
import 'package:nutrical/utils/constants.dart';

abstract class IMCCalculator {
  double calculateIMC(double weight, double height);
}

abstract class IMCStatusCalculator {
  String getIMCStatus(double imc);
}

// Implementación de la clase IMCCalculator
class DefaultIMCCalculator implements IMCCalculator {
  @override
  double calculateIMC(double weight, double height) {
    return weight / (height * height);
  }
}

class DefaultIMCStatusCalculator implements IMCStatusCalculator {
  @override
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
}
