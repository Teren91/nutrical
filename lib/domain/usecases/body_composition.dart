abstract class BodyCompositionCalculator {
  calculateYuhasz(bool isFemale, int fold1, int fold2, int fold3, int fold4,
      int fold5, int fold6);

  calculateIndexHipWaist(double hip, double waist);
}

class DefaultBodyCompositionCalculator implements BodyCompositionCalculator {
  @override
  double calculateYuhasz(bool isFemale, int fold1, int fold2, int fold3,
      int fold4, int fold5, int fold6) {
    if (isFemale) {
      return 4.56 + ((fold1 + fold2 + fold3 + fold4 + fold5 + fold6) * 0.143);
    } else {
      return 3.64 + ((fold1 + fold2 + fold3 + fold4 + fold5 + fold6) * 0.097);
    }
  }

  @override
  double calculateIndexHipWaist(double hip, double waist) {
    return hip / waist;
  }
}

