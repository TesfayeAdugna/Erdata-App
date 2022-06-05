import 'package:equatable/equatable.dart';

import '../../models/login_model.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}
class LoginTrial extends LoginEvent{
  @override
  List<Object?> get props => [];
}
class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}
class LoginPressd extends LoginEvent {
  final String username;
  final String Password;

  LoginPressd({required this.username, required this.Password});

  @override
  List<Object> get props => [username, Password];

  @override
  String toString() => 'LoginPressed { username: $username, Password: $Password}';
}
