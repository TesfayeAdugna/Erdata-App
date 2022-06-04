import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:sec_2/erdata/data_providers/suggestion_data_provider.dart';
import 'package:sec_2/erdata/models/model.dart';
import 'package:sec_2/erdata/repository/suggestion_repository.dart';
import 'package:sec_2/erdata/screens/screens.dart';

class MockChildSuggest extends Mock implements SuggestionRepository {}

void main() {
  late MockChildSuggest mockChildSuggest;

  setUp(() {
    mockChildSuggest = MockChildSuggest();
  });
  // Build our app and trigger a frame.

  Widget currentWidget() {
    return MultiProvider(
        providers: [
          Provider<SuggestionDataProvider>(
            create: ((context) => SuggestionDataProvider()),
          )
        ],
        builder: (context, child) {
          return MaterialApp(
            title: 'ERDATA',
            home: ChildSuggestion(),
          );
        });
  }

  testWidgets("Children suggestion title matches", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());
    expect(find.byKey(const Key('scaffoldState')), findsOneWidget);
  });

  testWidgets("Suggestion Page drawer check", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();

    expect(find.text('DONATE'), findsOneWidget);
    expect(find.text('DASHBOARD'), findsOneWidget);
  });
}
