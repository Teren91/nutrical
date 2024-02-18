

const Map<String, dynamic> imcTable = {
  "Peso insuficiente": 18.5,
  "Peso normal": 24.9,
  "Sobrepeso grado I": 26.9,
  "Sobrepeso grado II (preobesidad)": 29.9,
  "Obesidad Tipo I": 34.9,
  "Obesidad Tipo II": 39.9,
  "Obesidad Tipo III (mórbida)": 49.9,
  "Obesidad Tipo IV (extrema)": 50
};

List<List<dynamic>> bodyComplexionTable = [
  ['Pequeña', 9.6, 10.1],
  ['Mediana', 10.4, 11],
  ['Grande', 10.5, 11.1]
];

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