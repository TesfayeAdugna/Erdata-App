import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sec_2/account/repository/user_repository.dart';
import 'login.dart';
import '../authenticate_bloc/authenticate.dart';
import '../../repository/login_repository.dart';
import '../blocs.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({required this.userRepository, required this.authenticationBloc})
      : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(NullLogin());
  @override
  LoginState get initialState => NullLogin();
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPressd) {
      yield LogingIn();
      try {
        final token = await userRepository.login(event.username, event.Password);
        authenticationBloc.add(Authenticated(accessToken: token));
        yield LoginOperationSuccess();
      } catch (e) {
        LoginOperationFailure(e.toString());
      }
    }
  }
}