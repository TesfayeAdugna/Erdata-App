import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:erdata/custom_widget/custom_widgets.dart';
import 'package:erdata/erdata/screens/children_list.dart';

void main() {
  // Build our app and trigger a frame.

  Widget currentWidget() {
    return MaterialApp(
      title: 'ERDATA',
      home: ChildrenList(),
    );
  }

  testWidgets("Children List title matches", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());
    expect(find.text('CHILDREN LIST'), findsOneWidget);
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
