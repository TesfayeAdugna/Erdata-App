
import 'package:sec_2/forms/login.dart';

import 'forms/user_registration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_2/home.dart';
import '../erdata/screens/children_list.dart';



void main() => runApp(profile());

class profile extends StatelessWidget {
  profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: "ERDATA",
      );

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => HomePage()),
        GoRoute(
          name: 'children_list',
          path: '/children_list', 
          pageBuilder: (BuildContext context, state)=>
             MaterialPage(
              key: state.pageKey,
              child: ChildrenList(),
            ),
          
        ),
    GoRoute(
        path: '/user_registration',
        builder: (BuildContext context, GoRouterState state) =>
            UserRegistrationScreen()),
    GoRoute(
        path: '/login.dart',
        builder: (BuildContext context, GoRouterState state) => LoginScreen()),
    GoRoute(
        path: '/children_registration',
        builder: (BuildContext context, GoRouterState state) =>
            UserRegistrationScreen())
  ]);
}
