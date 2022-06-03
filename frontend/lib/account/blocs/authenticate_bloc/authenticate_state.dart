// import 'dart:html';

import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends AuthenticationState{}

class LoginLoading extends AuthenticationState{}

class AuthenticationSuccessful extends AuthenticationState{}

class AuthenticationFailure extends AuthenticationState{}