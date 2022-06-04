import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';

import 'package:sec_2/home.dart';

void main() {
  // Build our app and trigger a frame.

  Widget currentWidget() {
    return const MaterialApp(
      title: 'ERDATA',
      home: HomePage(),
    );
  }

  testWidgets("Home page title matches", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());
    expect(find.text('ERDATA'), findsOneWidget);
  });

  testWidgets("drawer check", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();

    expect(find.text('ABOUT'), findsOneWidget);
  });

  testWidgets("footer check", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Column(children: [
      Text("PHONE"),
      Text("INSTAGRAM"),
      Text("EMAIL"),
      Text("FACEBOOK"),
      Text("TELEGRAM"),
    ])));

    expect(find.text('PHONE'), findsOneWidget);
    expect(find.text('EMAIL'), findsOneWidget);
    expect(find.text('INSTAGRAM'), findsOneWidget);
    expect(find.text('FACEBOOK'), findsOneWidget);
    expect(find.text('TELEGRAM'), findsOneWidget);
  });
}
