import 'package:equatable/equatable.dart';

import '../../models/login_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class NullLogin extends LoginState{}
class LogingIn extends LoginState {}

class LoginOperationSuccess extends LoginState {
  
}

class LoginOperationFailure extends LoginState {
  final Object error;

  const LoginOperationFailure(this.error);
  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginOperationFailure {$error}';
}