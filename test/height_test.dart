import 'package:nutrical/domain/usecases/heigth_calculator.dart';
import 'package:nutrical/domain/usecases/imc_calculator.dart';
import 'package:nutrical/utils/functions.dart';
import 'package:test/test.dart';

void main() {
  group('Calculo de altura', () {

    
      final HeigthCalculator heigthCalculator = DefaultHeigthCalculator();
    test('La altura por longitud de rodilla', () {


      expect(heigthCalculator.calculateKneeHeight(false, 32, 55), 174.01);
    });

    test('La altura por longitud rodilla-maleolo', () {
      //double height;
      // height = getHeightLRM(false, 32, 53);
      // height = height.toInt().toDouble();
      expect(heigthCalculator.calculatelengthKneeMalleolusHeigth(false, 32, 53).toInt().toDouble(), 175);
    });

    test('La altura por ennvergadura', () {
      // double height;
      // height = getHeightWingSpan(false, 84);

      expect(heigthCalculator.calculateWingSpanHeigth(false, 84).toInt(), 175);
    });
  });

  group('Calculo IMC', () {
    test('IMC', () {  
      IMCCalculator imcCalculator = DefaultIMCCalculator();

      expect(imcCalculator.calculateIMC(59.1, 1.75).toStringAsFixed(2), formatDecimal('19.30') );
    });

    test('Estado IMC', () {
       IMCStatusCalculator imcStatusCalculator = DefaultIMCStatusCalculator();

      expect(imcStatusCalculator.getIMCStatus(19.30), 'Peso normal');
    });
  });
}
