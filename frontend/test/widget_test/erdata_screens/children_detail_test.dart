// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:sec_2/custom_widget/custom_widgets.dart';
// import 'package:sec_2/erdata/screens/child_detail.dart';

// void main() {
//   // Build our app and trigger a frame.

//   Widget currentWidget() {
//     return const MaterialApp(
//       title: 'ERDATA',
//       // home: ,
//     );
//   }

//   testWidgets("Children detail title matches", (WidgetTester tester) async {
//     await tester.pumpWidget(currentWidget());
//     expect(find.text('children detail'), findsOneWidget);
//   });

//   testWidgets("footer check", (WidgetTester tester) async {
//     await tester.pumpWidget(MaterialApp(
//         home: Column(children: [
//       Text("PHONE"),
//       Text("INSTAGRAM"),
//       Text("EMAIL"),
//       Text("FACEBOOK"),
//       Text("TELEGRAM"),
//     ])));

//     expect(find.text('PHONE'), findsOneWidget);
//     expect(find.text('EMAIL'), findsOneWidget);
//     expect(find.text('INSTAGRAM'), findsOneWidget);
//     expect(find.text('FACEBOOK'), findsOneWidget);
//     expect(find.text('TELEGRAM'), findsOneWidget);
//   });
// }
