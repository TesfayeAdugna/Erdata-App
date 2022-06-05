import 'package:equatable/equatable.dart';

import '../../models/registration_model.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class Idler extends RegistrationState {}

class RegistrationOperationSuccess extends RegistrationState {
}

class RegistrationOperationFailure extends RegistrationState {
  final Object error;

  const RegistrationOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}
