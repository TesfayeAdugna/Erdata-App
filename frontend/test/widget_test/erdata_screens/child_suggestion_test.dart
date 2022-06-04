import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
import 'package:sec_2/erdata/screens/screens.dart';

import 'package:sec_2/home.dart';

void main() {
  // Build our app and trigger a frame.

  Widget currentWidget() {
    return const MaterialApp(
      title: 'ERDATA',
      home: ChildSuggestion(),
    );
  }

  testWidgets("Children suggestion title matches", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());
    expect(find.text('SUGGEST ONE'), findsOneWidget);
  });

  testWidgets("Suggestion Page drawer check", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();

    expect(find.text('DONATE'), findsOneWidget);
    expect(find.text('DASHBOARD'), findsOneWidget);
  });
}
