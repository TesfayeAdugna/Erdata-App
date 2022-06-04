import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';

import 'package:sec_2/erdata/screens/about.dart';

void main() {
  Widget currentWidget() {
    return const MaterialApp(
      title: 'ERDATA',
      home: About(),
    );
  }

  testWidgets("about us page has title matches", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());
    expect(find.text('ABOUT US'), findsOneWidget);

    // finding those titles
    expect(find.text('ABOUT US'), findsOneWidget);

    const contWidget = Padding(padding: EdgeInsets.all(10));
    await tester.pumpWidget(Container(
      child: contWidget,
    ));

    expect(find.byWidget(contWidget), findsOneWidget);
  });

  testWidgets("drawer check", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();

    expect(find.text('LOG IN'), findsOneWidget);
    expect(find.text('HOME'), findsOneWidget);
  });

  testWidgets("About footer check", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());

    expect(find.text('PHONE'), findsOneWidget);
    expect(find.text('EMAIL'), findsOneWidget);
    expect(find.text('INSTAGRAM'), findsOneWidget);
    expect(find.text('FACEBOOK'), findsOneWidget);
    expect(find.text('TELEGRAM'), findsOneWidget);
  });
}
