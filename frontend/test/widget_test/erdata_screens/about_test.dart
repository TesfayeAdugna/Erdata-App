import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
// import 'package:sec_2/erdata/screens/children.dart';

// import 'package:sec_2/home.dart';

void main() {
  testWidgets('About Has the corresponding title name and sub-widget',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      appBar: HeaderBar(title: 'ABOUT US', appBar: AppBar()),
    )));

    // finding those titles
    expect(find.text('ABOUT US'), findsOneWidget);

    const contWidget = Padding(padding: EdgeInsets.all(10));
    await tester.pumpWidget(Container(
      child: contWidget,
    ));

    expect(find.byWidget(contWidget), findsOneWidget);
  });
  testWidgets("About drawer check", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Drawer(
      child: Text("LOG IN"),
    )));

    expect(find.text('LOG IN'), findsOneWidget);
  });

  testWidgets("About footer check", (WidgetTester tester) async {
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
