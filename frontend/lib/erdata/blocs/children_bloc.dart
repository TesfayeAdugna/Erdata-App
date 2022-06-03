import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/children_repository.dart';
import 'blocs.dart';

class ChildrenBloc extends Bloc<ChildrenEvent, ChildrenState> {
  final ChildrenRepository childrenRepository;

  ChildrenBloc({required this.childrenRepository}) : super(ChildrenLoading()) {
    on<ChildrenLoad>((event, emit) async {
      emit(ChildrenLoading());
      try {
        final childrens = await childrenRepository.fetchAll();
        emit(ChildrenOperationSuccess(childrens));
      } catch (error) {
        emit(ChildrenOperationFailure(error));
      }
    });

    on<ChildrenCreate>((event, emit) async {
      try {
        await childrenRepository.create(event.children);
        final childrens = await childrenRepository.fetchAll();
        emit(ChildrenOperationSuccess(childrens));
      } catch (error) {
        emit(ChildrenOperationFailure(error));
      }
    });

    on<ChildrenUpdate>((event, emit) async {
      try {
        await childrenRepository.update(event.id, event.children);
        final childrens = await childrenRepository.fetchAll();
        emit(ChildrenOperationSuccess(childrens));
      } catch (error) {
        emit(ChildrenOperationFailure(error));
      }
    });

    on<ChildrenDelete>((event, emit) async {
      try {
        await childrenRepository.delete(event.id);
        final childrens = await childrenRepository.fetchAll();
        emit(ChildrenOperationSuccess(childrens));
      } catch (error) {
        emit(ChildrenOperationFailure(error));
      }
    });
  }
}
