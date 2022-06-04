import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
import 'package:sec_2/erdata/screens/donate.dart';

void main() {
  // Build our app and trigger a frame.

  Widget currentWidget() {
    return const MaterialApp(
      title: 'ERDATA',
      home: Donate(),
    );
  }

  testWidgets("Donate title matches", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());
    expect(find.text('DONATE'), findsOneWidget);
  });

  testWidgets("Bank name matches", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());
    expect(find.text('Commercial Bank of Ethiopia'), findsOneWidget);
    expect(find.text('Oromia International Bank'), findsOneWidget);

    expect(find.text('Zemen Bank'), findsOneWidget);

    expect(find.text('Abissinia Bank'), findsOneWidget);
  });
  testWidgets("Donate page left drawer check", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();

    expect(find.text('SIGNUP'), findsOneWidget);
  });

  testWidgets("footer check", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());

    expect(find.text('PHONE'), findsOneWidget);
    expect(find.text('EMAIL'), findsOneWidget);
    expect(find.text('INSTAGRAM'), findsOneWidget);
    expect(find.text('FACEBOOK'), findsOneWidget);
    expect(find.text('TELEGRAM'), findsOneWidget);
  });
}
