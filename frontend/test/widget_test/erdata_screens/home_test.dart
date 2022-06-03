import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
import 'package:sec_2/erdata/screens/children.dart';

import 'package:sec_2/home.dart';

void main() {
  testWidgets('HomePage Has the corresponding title name',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HomePage());
    await tester.pumpAndSettle();
    await tester.pumpWidget(MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
            home: SafeArea(
                child: Scaffold(
          appBar: HeaderBar(title: 'ERDATA', appBar: AppBar()),
          body: Text("WELCOME TO ERDATA"),
        )))));

    // finding those titles
    expect(find.text('ERDATA'), findsOneWidget);
    expect(find.text('WELCOME TO ERDATA'), findsOneWidget);
  });
  testWidgets("drawer check", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Drawer(
      child: Text("ABOUT"),
    )));

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
