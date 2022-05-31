import 'package:sec_2/erdata/screens/about.dart';
import 'package:sec_2/erdata/screens/donate.dart';
import 'package:sec_2/forms/login.dart';
import '../forms/forms.dart';
import '../erdata/screens/screens.dart';
import 'erdata/screens/child_suggestion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_2/home.dart';

void main() => runApp(profile());

class profile extends StatelessWidget {
  profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: "ERDATA",
      );

  final GoRouter _router = GoRouter(initialLocation: '/', routes: <GoRoute>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => HomePage()),
    GoRoute(
      name: 'children_list',
      path: '/children_list',
      pageBuilder: (BuildContext context, state) => MaterialPage(
        key: state.pageKey,
        child: ChildrenList(),
      ),
    ),
    GoRoute(
        name: 'user_register',
        path: '/user_registration',
        builder: (BuildContext context, GoRouterState state) =>
            UserRegistrationScreen()),
    GoRoute(
        name: 'login',
        path: '/login.dart',
        builder: (BuildContext context, GoRouterState state) => LoginScreen()),
    GoRoute(
        name: 'child_register',
        path: '/children_registration',
        builder: (BuildContext context, GoRouterState state) =>
            ChildrenRegistrationScreen()),
    GoRoute(
        name: 'child_suggest',
        path: '/child_suggestion',
        builder: (BuildContext context, GoRouterState state) =>
            ChildSuggestion()),
    GoRoute(
        name: 'donate',
        path: '/donate',
        builder: (BuildContext context, GoRouterState state) => Donate()),
    GoRoute(
        name: 'about',
        path: '/about',
        builder: (BuildContext context, GoRouterState state) => About()),
    GoRoute(
        name: 'child_detail',
        path: '/child_detail',
        builder: (BuildContext context, GoRouterState state) => Child_Detail())
  ]);
}
