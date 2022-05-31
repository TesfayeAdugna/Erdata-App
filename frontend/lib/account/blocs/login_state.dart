import 'package:equatable/equatable.dart';

import '../models/login_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LogingIn extends LoginState {}

class LoginOperationSuccess extends LoginState {
  final Login? login;

  const LoginOperationSuccess([this.login]);
}

class LoginOperationFailure extends LoginState {
  final Object error;

  const LoginOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}