import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class NullAuthentication extends AuthenticationEvent {}

class Authenticated extends AuthenticationEvent {
  final String accessToken;
  const Authenticated({required this.accessToken});

  @override
  List<Object> get props => [accessToken];

  @override
  String toString() => 'Authenticated {$accessToken}';
}

class UnAuthenticated extends AuthenticationEvent {}
