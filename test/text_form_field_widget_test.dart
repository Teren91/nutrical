import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutrical/pages/home_page.dart';
import 'package:nutrical/widgets/text_form_field_widget.dart';

final ageController = TextEditingController();
Widget testTextFormFieldWidget = TextFormFieldWidget(
  controller: ageController,
  label: 'Altura',
  hintText: 'Altura en cm',
);

Widget createHomeScreen() => const MyHomePage(
      title: 'Nutrical',
    );

void main() {
  group('Home Page TextFormFieldWidget create', () {
    // testWidgets('A custom TextFormField', (tester) async {
    //   await tester.pumpWidget(createHomeScreen());
    //   expect(find.byType(TextFormFieldWidget), findsAny);
    // });

    // testWidgets('TextFormField Cabecera e IMC', (tester) async {
    //   final edadFinder = find.text('Edad');

    //   //EDAD
    //   await tester.pumpWidget(createHomeScreen());
    //   expect(edadFinder, findsOneWidget);
    //   await tester.tap(find.byType(TextFormFieldWidget).first);
    //   await tester.enterText(find.byType(TextFormFieldWidget).first, '32');
    //   await tester.pumpAndSettle(const Duration(seconds: 1));

    //   //PESO
    //   expect(find.byType(TextFormField).at(2), findsOneWidget);
    //   await tester.tap(find.byType(TextFormField).at(2));
    //   await tester.enterText(find.byType(TextFormField).at(2), '59');

    //   //ALTURA
    //   expect(find.byType(TextFormField).at(1), findsOneWidget);
    //   await tester.tap(find.byType(TextFormField).at(1));
    //   await tester.enterText(find.byType(TextFormField).at(1), '175');

    //   await tester.pumpAndSettle(const Duration(seconds: 2));
    // });

    testWidgets('TextFormField Altura', (tester) async {
      final edadFinder = find.byType(TextFormFieldWidget).at(0);
      final alturaRodillaFinder = find.byType(TextFormFieldWidget).at(1);
      final btnCalculateHeightFinder =
          find.byKey(const ValueKey('btnCalculateHeigth'));

      await tester.pumpWidget(createHomeScreen());

      //Introducir EDAD
      expect(edadFinder, findsOneWidget);
      await tester.tap(find.byType(TextFormFieldWidget).first);
      await tester.enterText(find.byType(TextFormFieldWidget).first, '32');
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //Introducir alturaALTURA
      expect(alturaRodillaFinder, findsOneWidget);
      await tester.tap(alturaRodillaFinder);
      //await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(alturaRodillaFinder, '60');
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //Scroll hacía abajo
      await tester.dragFrom(const Offset(0, 200), const Offset(0, -100));

      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.flingFrom(const Offset(0, 200), const Offset(0, -100), 1000);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //Pulsar botón
      final buttonPosition = tester.getCenter(btnCalculateHeightFinder);
      expect(find.byKey(const ValueKey('btnCalculateHeigth')), findsOneWidget);
      await tester.tapAt(buttonPosition);

      //Volver el scroll arriba
      await tester.dragFrom(const Offset(0, 400), const Offset(0, 100));

      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.flingFrom(const Offset(0, 400), const Offset(0, 100), 1000);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}
