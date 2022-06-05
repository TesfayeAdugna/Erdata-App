import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erdata/account/blocs/authenticate_bloc/authenticate.dart';
import 'package:erdata/account/blocs/blocs.dart';
import 'package:erdata/account/data_providers/data_providers.dart';
import 'package:erdata/account/repository/repository.dart';
import 'package:erdata/account/repository/user_repository.dart';
import 'package:erdata/admin/bloc/admin_bloc.dart';
import 'package:erdata/admin/bloc/admin_event.dart';
import 'package:erdata/admin/screens/suggested_detail.dart';
import 'package:erdata/admin/screens/suggested_list.dart';
import 'package:erdata/admin/screens/user_list_admin.dart';
import 'package:erdata/erdata/blocs/blocs.dart';
import 'package:erdata/erdata/repository/suggestion_repository.dart';
import 'package:erdata/erdata/screens/child_update_screen.dart';
import './erdata/data_providers/data_provider.dart';
import 'admin/screens/admin.dart';
import '../erdata/screens/screens.dart';
import 'erdata/repository/children_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:erdata/erdata/screens/home.dart';
import 'account/screens/logins.dart';
import 'custom_widget/theme.dart';

void main() {
  final ChildrenRepository childrenRepository =
      ChildrenRepository(ChildrenDataProvider());
  final RegistrationRepository registrationRepository =
      RegistrationRepository(RegistrationDataProvider());
  // final LoginRepository loginRepository = LoginRepository(LoginDataProvider());
  final UserBERepository userBERepository =
      UserBERepository(UserBEDataProvider());
  final SuggestionRepository suggestionRepository =
      SuggestionRepository(SuggestionDataProvider());
  final UserRepository userRepository = UserRepository();
  final AuthenticationBloc authenticationBloc =
      AuthenticationBloc(userRepository: userRepository);

  BlocOverrides.runZoned(
    () => runApp(
      ErdataApp(
        childrenRepository: childrenRepository,
        registrationRepository: registrationRepository,
        userBERepository: userBERepository,
        suggestionRepository: suggestionRepository,
        authenticationBloc: authenticationBloc,
        userRepository: userRepository,
      ),
    ),
  );
}

class ErdataApp extends StatelessWidget {
  final ChildrenRepository childrenRepository;
  final RegistrationRepository registrationRepository;
  final UserBERepository userBERepository;
  final SuggestionRepository suggestionRepository;
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  const ErdataApp(
      {Key? key,
      required this.childrenRepository,
      required this.registrationRepository,
      required this.userBERepository,
      required this.suggestionRepository,
      required this.authenticationBloc,
      required this.userRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: childrenRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ChildrenBloc(childrenRepository: childrenRepository)
                  ..add(const ChildrenLoad()),
          ),
          BlocProvider(
            create: (context) => RegistrationBloc(
                registrationRepository: registrationRepository),
          ),
          BlocProvider(
            create: (context) => AdminBloc(userBERepository: userBERepository)
              ..add(const UserListLoad()),
          ),
          BlocProvider(
            create: (context) =>
                SuggestionBloc(suggestionRepository: suggestionRepository)
                  ..add(SuggestionLoad()),
          ),
          BlocProvider(
            create: (context) => LoginBloc(
                userRepository: userRepository,
                authenticationBloc: authenticationBloc)
              ..add(LoginTrial()),
          ),
        ],
        child: MaterialApp.router(
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          title: 'ERDATA',
          theme: AppTheme.light(),
        ),
      ),
    );
  }
}

final GoRouter _router = GoRouter(initialLocation: '/', routes: <GoRoute>[
  GoRoute(
    name: 'home',
    path: '/',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: HomePage(),
    ),
  ),
  GoRoute(
    name: 'children_list',
    path: '/children_list',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: ChildrenList(),
    ),
    routes: [
      GoRoute(
      name: 'detailsRouteName',
      path: ':id',
      pageBuilder: (BuildContext context, state) {
        final int id = int.parse(state.params['id']!);
        return MaterialPage(
          key: state.pageKey,
          child: Child_Detail(childid: id),
        );
      }),
    ]
  ),
  
  GoRoute(
    name: 'user_list',
    path: '/user_list',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: UsersList(),
    ),
    routes: [
      GoRoute(
      name: 'usersdetal',
      path: ':id',
      pageBuilder: (BuildContext context, state) {
        final int id = int.parse(state.params['id']!);
        return MaterialPage(
          key: state.pageKey,
          child: UserDetail(userid: id),
        );
      }),
    ]
  ),
  GoRoute(
    name: 'user_registration',
    path: '/user_registration',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: UserRegistrationScreen(),
    ),
  ),
  GoRoute(
    name: 'login',
    path: '/login',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: LoginScreen(),
    ),
  ),
  GoRoute(
    name: 'child_registration',
    path: '/child_registration',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: ChildrenRegistrationScreen(),
    ),
  ),
  GoRoute(
    name: 'child_suggestion',
    path: '/child_suggestion',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: ChildSuggestion(),
    ),
  ),
  GoRoute(
    name: 'donation',
    path: '/donation',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: Donate(),
    ),
  ),
  GoRoute(
    name: 'suggested_list',
    path: '/suggested_list',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: SuggestedList(),
    ),
    routes: [
      GoRoute(
      name: 'suggested_detail',
      path: ':id',
      pageBuilder: (BuildContext context, state) {
        final int id = int.parse(state.params['id']!);
        return MaterialPage(
          key: state.pageKey,
          child: Suggested_Detail(suggestedid: id),
        );
        },
      routes: [
      GoRoute(
      name: 'children_update',
      path: ':id',
      pageBuilder: (BuildContext context, state) {
        final int id = int.parse(state.params['id']!);
        return MaterialPage(
          key: state.pageKey,
          child:ChildrenUpdation(suggestedid: id),
        );

      }
      
      ),

    ]
      ),

    ]
  ),
  GoRoute(
    name: 'about',
    path: '/about',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: About(),
    ),
  ),
  GoRoute(
    name: 'admin_screen',
    path: '/admin_screen',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: AdminScreen(),
    ),
  ),
  // GoRoute(
  //   name: 'detailsRouteName',
  //   // 2
  //   path: '/children_list/:id',
  //   pageBuilder: (BuildContext context, state) {
  //     final code = state.params['id']!;
  //     final id = int.parse(code.toString());
  //     final res = ChildrenRepository(ChildrenDataProvider()).fetchById(id);
  //     final Children child;
  //     res.then((value) {child = ba});
  //     return MaterialPage(
  //       key: state.pageKey,
  //       child: Child_Detail(child: res),
  //     );
  //   },
  //   // 3
  //   redirect: (state) => state.namedLocation(
  //     'subDetailsRouteName',
  //     params: {'id': state.params['id']!},
  //   ),
  // ),
]);
