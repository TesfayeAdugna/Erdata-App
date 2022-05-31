import 'package:equatable/equatable.dart';

import '../models/registration_model.dart';

abstract class RegistrationEvent extends Equatable {

  const RegistrationEvent();
}

class RegistrationCreate extends RegistrationEvent {
  final Registration registration;

  const RegistrationCreate(this.registration);

  @override
  List<Object> get props => [registration];

  @override
  String toString() => 'User Created {Username: ${registration.username}}';
}
