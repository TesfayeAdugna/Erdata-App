import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sec_2/custom_widget/custom_widgets.dart';
import 'package:sec_2/erdata/models/children_model.dart';
import 'package:sec_2/erdata/screens/children_list.dart';
import 'package:sec_2/erdata/repository/children_repository.dart';

class MockChildRepo extends Mock implements ChildrenRepository {}

void main() {
  late MockChildRepo mockChildRepo;

  setUp(() {
    mockChildRepo = MockChildRepo();
  });

  final childrenListed = [
    Children(
        id: 3,
        first_name: "wow",
        last_name: "wow",
        photos: "assets/profile_image1.jpg",
        gender: "male",
        birth_date: " 30-12-02",
        description: " this child...",
        bank_account: "102093993030",
        kebele: "12",
        region: "addis",
        woreda: "14",
        zone: "yeka"),
  ];

  void ChildrenPresented() {
    when(() => mockChildRepo.fetchAll()).thenAnswer((_) async {
      await Future.delayed(const Duration(seconds: 2));
      return childrenListed;
    });
  }

  // Build our app and trigger a frame.
  Widget currentWidget() {
    return MaterialApp(
      title: 'ERDATA',
      home: ChildrenList(),
    );
  }

  testWidgets("children list title matches", (WidgetTester tester) async {
    await tester.pumpWidget(currentWidget());
    expect(find.text('CHILDREN LIST'), findsOneWidget);
  });

  testWidgets("Loading indicator shows while loading",
      (WidgetTester tester) async {
    ChildrenPresented();
    await tester.pumpWidget(currentWidget());
    await tester.pump();

    expect(find.byType(LayoutBuilder), findsOneWidget);

    await tester.pumpAndSettle();
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
