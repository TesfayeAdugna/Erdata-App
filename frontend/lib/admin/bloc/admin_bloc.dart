import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec_2/account/repository/registration_repository.dart';
import 'package:sec_2/admin/repository/admin_repository.dart';
import 'admin.dart';


class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminRepository adminRepository;

  AdminBloc({required this.adminRepository}) : super(UserListLoading()) {
    on<UserListLoad>((event, emit) async {
      emit(UserListLoading());
      try {
        final users = await adminRepository.fetchAll();
        emit(UserListLoadSucccess(users));
      } catch (error) {
        emit(UserListLoadFailure(error));
      }
    });

    on<UserAdd>((event, emit) async {
      try {
        await adminRepository.create(event.user);
        final childrens = await adminRepository.fetchAll();
        emit(UserListLoadSucccess(childrens));
      } catch (error) {
        emit(UserListLoadFailure(error));
      }
    });

    
   

    on<UserDelete>((event, emit) async {
      try {
        await adminRepository.delete(event.id);
        final childrens = await adminRepository.fetchAll();
        emit(UserListLoadSucccess(childrens));
      } catch (error) {
        emit(UserListLoadFailure(error));
      }
    });
  }
}