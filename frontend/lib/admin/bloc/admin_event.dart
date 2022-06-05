import 'package:equatable/equatable.dart';

import 'package:erdata/account/models/registration_model.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();
}

class UserListLoad extends AdminEvent {
  const UserListLoad();

  @override
  List<Object> get props => [];
}

class UserAdd extends AdminEvent {
  final Registration user;

  const UserAdd(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Course Created {children Id: ${user.id}}';
}



class UserDelete extends AdminEvent {
  final int id;

  const UserDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Children Deleted {Children Id: $id}';

  @override
  bool? get stringify => true;
}