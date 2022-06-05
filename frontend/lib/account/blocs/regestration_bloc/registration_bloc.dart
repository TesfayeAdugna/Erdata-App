import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/registration_repository.dart';
import '../blocs.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository registrationRepository;

  RegistrationBloc({required this.registrationRepository}) : super(Idler()) {
    on<RegistrationCreate>((event, emit) async {
      try {
        await registrationRepository.create(event.registration);
        emit(RegistrationOperationSuccess());
      } catch (error) {
        emit(RegistrationOperationFailure(error));
      }
    });
  }
}
