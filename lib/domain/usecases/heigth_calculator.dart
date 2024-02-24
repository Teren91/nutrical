abstract class HeigthCalculator {
  calculateKneeHeight(bool isFemale, int age, int kneeHeight);
  calculatelengthKneeMalleolusHeigth(
      bool isFemale, int age, int lengthKneeMalleolus);
  calculateWingSpanHeigth(bool isFemale, int wingSpan);
}

class DefaultHeigthCalculator implements HeigthCalculator {
  @override
  double calculateKneeHeight(bool isFemale, int age, int kneeHeight) {
    if (isFemale) {
      return 84.88 - (0.24 * age) + (1.83 * kneeHeight);
    } else {
      return 64.19 - (0.04 * age) + (2.02 * kneeHeight);
    }
  }

  @override
  calculatelengthKneeMalleolusHeigth(
      bool isFemale, int age, int lengthKneeMalleolus) {
    if (isFemale) {
      return (lengthKneeMalleolus * 1.263) - (0.159 * age) + 107.7;
    } else {
      return (lengthKneeMalleolus * 1.121) - (0.117 * age) + 119.6;
    }
  }

  @override
  calculateWingSpanHeigth(bool isFemale, int wingSpan) {
    if (isFemale) {
      return (1.35 * wingSpan) + 60.1;
    } else {
      return (1.4 * wingSpan) + 57.8;
    }
  }
}
