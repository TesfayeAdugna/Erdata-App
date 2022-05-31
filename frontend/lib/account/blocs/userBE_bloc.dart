import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/userBE_repository.dart';
import 'blocs.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserBERepository userBERepository;

  UserBloc({required this.userBERepository}) : super(UserLoading()) {
    on<UserLoad>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userBERepository.fetchAll();
        emit(UserOperationSuccess(users));
      } catch (error) {
        emit(UserOperationFailure(error));
      }
    });
  }
}
