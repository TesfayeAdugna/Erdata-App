import 'package:equatable/equatable.dart';

import '../models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserOperationSuccess extends UserState {
  final Iterable<UserBE> users;

  const UserOperationSuccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class UserOperationFailure extends UserState {
  final Object error;

  const UserOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}