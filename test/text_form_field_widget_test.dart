import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutrical/pages/home_page.dart';
import 'package:nutrical/widgets/text_form_field_widget.dart';

final ageController = TextEditingController();
Widget testTextFormFieldWidget = TextFormFieldWidget(
  lrmController: ageController,
  label: 'Altura',
  hintText: 'Altura en cm',
);

Widget createHomeScreen() => const MyHomePage(
      title: 'Nutrical',
    );

void main() {
  group('Home Page TextFormFieldWidget create', () {
    testWidgets('A custom TextFormField', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(TextFormFieldWidget), findsAny);
    });

    testWidgets('TextFormField Cabecera e IMC', (tester) async {
      final edadFinder = find.text('Edad');

      //EDAD
      await tester.pumpWidget(createHomeScreen());
      expect(edadFinder, findsOneWidget);
      await tester.tap(find.byType(TextFormFieldWidget).first);
      await tester.enterText(find.byType(TextFormFieldWidget).first, '32');
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //PESO
      expect(find.byType(TextFormField).at(2), findsOneWidget);
      await tester.tap(find.byType(TextFormField).at(2));
      await tester.enterText(find.byType(TextFormField).at(2), '59');

      //ALTURA
      expect(find.byType(TextFormField).at(1), findsOneWidget);
      await tester.tap(find.byType(TextFormField).at(1));
      await tester.enterText(find.byType(TextFormField).at(1), '175');

      await tester.pumpAndSettle(const Duration(seconds: 2));
    });

    testWidgets('TextFormField Altura', (tester) async {
      final edadFinder = find.byType(TextFormFieldWidget).at(0);
      final alturaRodillaFinder = find.byType(TextFormFieldWidget).at(1);
      //final btnCalculateHeightFinder =
          //find.byKey(const ValueKey('btnCalculateHeigth'));

      await tester.pumpWidget(createHomeScreen());

      //EDAD
      expect(edadFinder, findsOneWidget);
      await tester.tap(find.byType(TextFormFieldWidget).first);
      await tester.enterText(find.byType(TextFormFieldWidget).first, '32');
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //ALTURA
      expect(alturaRodillaFinder, findsOneWidget);
      await tester.tap(alturaRodillaFinder);
      //await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(alturaRodillaFinder, '60');
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //Scroll hacía abajo

//       // //final gesture = await tester.startGesture(const Offset(83, -548.4));
//       //   //await gesture.moveBy(const Offset(83, -548.4));
//       // final gesture = await tester.startGesture(const Offset(0, 400));
//       // await gesture.moveBy(const Offset(0, -100));
//       // await tester.pumpAndSettle(const Duration(seconds: 1));

//       // //Apretar botón
//       // //await tester.pumpAndSettle(const Duration(seconds: 1));
//       // expect(find.byKey(const ValueKey('btnCalculateHeigth')), findsOneWidget);

//       // await gesture.moveTo(const Offset(83, 648.4));
//       // await tester.pumpAndSettle(const Duration(seconds: 1));
//       // await tester.tap(find.byKey(const ValueKey('btnCalculateHeigth')));
//       // await tester.pumpAndSettle();

//       final buttonPosition = tester.getCenter(btnCalculateHeightFinder);
//      // await tester.pump();
//      //await tester.pumpAndSettle(const Duration(seconds: 3));
//       // await gesture.moveTo(buttonPosition);
//       // await tester.pump();
//       // await tester.pumpAndSettle(const Duration(seconds: 3));

//       expect(find.byKey(const ValueKey('btnCalculateHeigth')), findsOneWidget);
// // await tester.tap(btnCalculateHeightFinder);
//       await tester.tapAt(buttonPosition);
//      // await tester.pump();
//       await tester.pumpAndSettle(const Duration(seconds: 3));
      
    });

  });
}
