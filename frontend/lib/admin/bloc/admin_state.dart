import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sec_2/account/models/model.dart';

abstract class AdminState extends Equatable {
  const AdminState();
   @override
  
  List<Object?> get props => [];
}

class InitialState extends AdminState{
}
class UserListLoading extends AdminState{
  
}
class UserListLoadSucccess extends AdminState {
  final List<UserBE> users;

  const UserListLoadSucccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class UserListLoadFailure extends AdminState {
  final Object error;

  const UserListLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}







