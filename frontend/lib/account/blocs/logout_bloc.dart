import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/logout_repository.dart';
import 'blocs.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutRepository logoutRepository;

  LogoutBloc({required this.logoutRepository}) : super(Idle()) {
    
    on<LogoutCreate>((event, emit) async {
      try {
        await logoutRepository.create();
        emit(LogoutOperationSuccess());
      } catch (error) {
        emit(LogoutOperationFailure(error));
      }
    });

    }
}