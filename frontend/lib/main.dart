import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_2/account/data_providers/data_providers.dart';
import 'package:sec_2/account/repository/repository.dart';
import 'package:sec_2/admin/bloc/admin_bloc.dart';
import 'package:sec_2/admin/bloc/admin_event.dart';
import 'package:sec_2/admin/data_provider/user_local_provider.dart';
import 'package:sec_2/admin/repository/admin_repository.dart';
import 'package:sec_2/admin/screens/suggested_list.dart';
import 'package:sec_2/admin/screens/user_list_admin.dart';
import 'package:sec_2/erdata/blocs/blocs.dart';
import 'package:sec_2/erdata/models/model.dart';
import 'package:sec_2/erdata/repository/suggestion_repository.dart';
import './erdata/data_providers/data_provider.dart';
import 'account/blocs/registration_bloc.dart';
import 'account/data_providers/registration_data_provider.dart';
import 'account/repository/registration_repository.dart';
import 'admin/screens/admin.dart';
import '../erdata/screens/screens.dart';
import 'erdata/repository/children_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_2/home.dart';
import 'account/screens/logins.dart';
import 'theme.dart';

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

  BlocOverrides.runZoned(
    () => runApp(
      ErdataApp(
        childrenRepository: childrenRepository,
        registrationRepository: registrationRepository,
        userBERepository: userBERepository,
        suggestionRepository: suggestionRepository,
      ),
    ),
  );
}

class ErdataApp extends StatelessWidget {
  final ChildrenRepository childrenRepository;
  final RegistrationRepository registrationRepository;
  final UserBERepository userBERepository;
  final SuggestionRepository suggestionRepository;

  const ErdataApp(
      {Key? key,
      required this.childrenRepository,
      required this.registrationRepository,
      required this.userBERepository,
      required this.suggestionRepository})
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
    
  ),
  GoRoute(
  name: 'detailsRouteName',
  // 2
  path: '/children_list/:id',
  // 3
  redirect: (state) => state.namedLocation(
    'subDetailsRouteName',
    params: {'id': state.params['id']!},
  ),
),
  GoRoute(
    name: 'user_list',
    path: '/user_list',
    pageBuilder: (BuildContext context, state) => MaterialPage(
      key: state.pageKey,
      child: UsersList(),
    ),
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
  ),
  //  GoRoute(
  //   name: 'child_update',
  //   path: '/child_update',
  //   pageBuilder: (BuildContext context, state) => MaterialPage(
  //     key: state.pageKey,
  //     child: ChildrenUpdate(),
  //   ),
  // ),
  // GoRoute(
  //     name: 'children_detail',
  //     path: '/children_detail',
  //     pageBuilder: (BuildContext context, state) {
  //       final Children children;
  //       return MaterialPage(
  //         key: state.pageKey,
  //         child: Child_Detail(child: children),
  //       );
  //     }),
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
]);

// Page<dynamic> _errorBuilder(BuildContext context, GoRouterState state) =>
//     MaterialPage<ErrorPage>(
//       key: state.pageKey,
//       child: ErrorPage(error: '',),
//     );

// class ErrorPage extends StatelessWidget {
//   final String error;
//   ErrorPage({required this.error});

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text("Some error");

//   }
// }

// Future<ChildrenRepository> child(String? id) async{
  
//   return ChildrenRepository(ChildrenDataProvider().fetchByid(id));
// }
