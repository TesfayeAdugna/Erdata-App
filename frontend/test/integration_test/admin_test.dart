import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sec_2/admin/screens/admin.dart' as admin;
import 'package:sec_2/admin/screens/admin_screen.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // Build our app and trigger a frame.

  Widget currentWidget() {
    return MaterialApp(
      title: 'ERDATA',
      home: AdminScreen(),
    );
  }

  testWidgets("Erdata admin title matches", (tester) async {
    admin.AdminScreen();
    await tester.pumpAndSettle();
    await tester.pumpWidget(currentWidget());
    expect(find.text('Dashboard'), findsOneWidget);
  });

  testWidgets("drawer check", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();

    expect(find.text('ABOUT'), findsOneWidget);
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
