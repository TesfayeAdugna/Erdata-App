import 'package:equatable/equatable.dart';

import '../models/childred_model.dart';

abstract class ChildrenState extends Equatable {
  const ChildrenState();

  @override
  List<Object> get props => [];
}

class ChildrenLoading extends ChildrenState {}

class ChildrenOperationSuccess extends ChildrenState {
  final Iterable<Children> childrens;

  const ChildrenOperationSuccess([this.childrens = const []]);

  @override
  List<Object> get props => [childrens];
}

class ChildrenOperationFailure extends ChildrenState {
  final Object error;

  const ChildrenOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}