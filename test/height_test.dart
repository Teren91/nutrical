import 'package:nutrical/utils/functions.dart';
import 'package:test/test.dart';

void main() {
  group('Calculo de altura', () {
    test('La altura por longitud de rodilla', () {
      double height;
      height = getHeight(false, 32, 55);

      expect(height, 174.01);
    });

    test('La altura por longitud rodilla-maleolo', () {
      double height;
      height = getHeightLRM(false, 32, 53);
      height = height.toInt().toDouble();
      expect(height, 175);
    });

    test('La altura por ennvergadura', () {
      double height;
      height = getHeightWingSpan(false, 84);

      expect(height.toInt(), 175);
    });
  });

  group('Calculo IMC', () {
    test('IMC', () {
      double imc;
      imc = getIMC(59.1, 175);

      expect(imc.toStringAsFixed(2), formatDecimal('19.30') );
    });

    test('Estado IMC', () {
      String imcStatus;
      imcStatus = getIMCStatus(19.30);

      expect(imcStatus, 'Peso normal');
    });
  });
}
