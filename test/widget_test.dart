// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temperature_converter/main.dart';

void main() {
  testWidgets('Test TextFields displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const TemperatureConverterApp());

    expect(find.text('Celsius'), findsOneWidget);
    expect(find.text('Fahrenheit'), findsOneWidget);
    expect(find.text('Kelvin'), findsOneWidget);

    var textFields = find.byType(TextField);
    expect(textFields, findsNWidgets(3));
  });

  testWidgets('Test celsius entered', (WidgetTester tester) async {
    await tester.pumpWidget(const TemperatureConverterApp());

    var textFields = find.byType(TextField);
    await tester.enterText(textFields.at(0), '0');
    tester.pump();
    expectSync(find.text('32.0'), findsOneWidget);
    expectSync(find.text('273.15'), findsOneWidget);
  });

  testWidgets('Test fahrenheit entered', (WidgetTester tester) async {
    await tester.pumpWidget(const TemperatureConverterApp());

    var textFields = find.byType(TextField);
    await tester.enterText(textFields.at(1), '0');
    tester.pump();
    expectSync(find.text('-17.77777777777778'), findsOneWidget);
    expectSync(find.text('255.3722222222222'), findsOneWidget);
  });

  testWidgets('Test kelvin entered', (WidgetTester tester) async {
    await tester.pumpWidget(const TemperatureConverterApp());

    var textFields = find.byType(TextField);
    await tester.enterText(textFields.at(2), '0');
    tester.pump();
    expectSync(find.text('-273.15'), findsOneWidget);
    expectSync(find.text('-459.66999999999996'), findsOneWidget);
  });
}
