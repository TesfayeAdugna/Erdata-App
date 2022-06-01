import 'package:equatable/equatable.dart';

import '../../models/login_model.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
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
