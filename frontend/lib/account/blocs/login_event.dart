import 'package:equatable/equatable.dart';

import '../models/login_model.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginCreate extends LoginEvent {
  final Login login;

  const LoginCreate(this.login);

  @override
  List<Object> get props => [login];

  @override
  String toString() => 'Login Created {Login Username: ${login.username}}';
}
