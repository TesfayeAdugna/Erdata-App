import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erdata/account/repository/registration_repository.dart';
import 'package:erdata/account/repository/repository.dart';
import 'package:erdata/admin/repository/admin_repository.dart';
import 'admin.dart';


class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final UserBERepository userBERepository;

  AdminBloc({required this.userBERepository}) : super(UserListLoading()) {
    on<UserListLoad>((event, emit) async {
      emit(UserListLoading());
      try {
        final users = await userBERepository.fetchAll();
        emit(UserListLoadSucccess(users));
      } catch (error) {
        emit(UserListLoadFailure(error));
      }
    });

  }
}