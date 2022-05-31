import 'package:equatable/equatable.dart';

import '../models/childred_model.dart';

abstract class ChildrenEvent extends Equatable {
  const ChildrenEvent();
}

class ChildrenLoad extends ChildrenEvent {
  const ChildrenLoad();

  @override
  List<Object> get props => [];
}

class ChildrenCreate extends ChildrenEvent {
  final Children children;

  const ChildrenCreate(this.children);

  @override
  List<Object> get props => [children];

  @override
  String toString() => 'Course Created {children Id: ${children.id}}';
}

class ChildrenUpdate extends ChildrenEvent {
  final int id;
  final Children children;

  const ChildrenUpdate(this.id, this.children);

  @override
  List<Object> get props => [id, children];

  @override
  String toString() => 'Children Updated {Children Id: ${children.id}}';
}

class ChildrenDelete extends ChildrenEvent {
  final int id;

  const ChildrenDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Children Deleted {Children Id: $id}';

  @override
  bool? get stringify => true;
}