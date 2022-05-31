import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/login_repository.dart';
import 'blocs.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LogingIn()) {
    
    on<LoginCreate>((event, emit) async {
      try {
        final login = await loginRepository.create(event.login);
        emit(LoginOperationSuccess(login));
      } catch (error) {
        emit(LoginOperationFailure(error));
      }
    });

    }
}