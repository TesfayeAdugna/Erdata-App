import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:erdata/account/repository/user_repository.dart';
import 'authenticate.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  AuthenticationBloc({required this.userRepository})
      : assert(userRepository != null),
        super(InitialState());
  @override
  AuthenticationState get initialState => InitialState();
  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is NullAuthentication) {
      final bool hasToken = await userRepository.hasToken();
      if (hasToken) {
        yield AuthenticationSuccessful();
      } else {
        yield AuthenticationFailure();
      }
    }
    if (event is Authenticated) {
      yield LoginLoading();
      await userRepository.persistToken(event.accessToken);
      yield AuthenticationSuccessful();
    }
    if (event is UnAuthenticated) {
       yield LoginLoading();
      await userRepository.deleteToken();
      yield AuthenticationFailure();
    }
  }
}
