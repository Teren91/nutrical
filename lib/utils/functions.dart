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
  return weight / (height * height);
}

String getIMCStatus(double imc) {
  if (imc < 18.5) {
    return "Abaixo do peso";
  } else if (imc < 24.9) {
    return "Peso normal";
  } else if (imc < 26.9) {
    return "Sobrepeso grado I";
  } else if (imc < 29.9) {
    return "Sobrepeso grado II (preobesidad)";
  } else if (imc < 34.9) {
    return "Obesidad Tipo I";
  } else if (imc < 39.9) {
    return "Obesidad Tipo II";
  } else if (imc < 49.9) {
    return "Obesidad Tipo III (mórbida)";
  } else {
    return "Obesidad Tipo IV (extrema)";
  }
}