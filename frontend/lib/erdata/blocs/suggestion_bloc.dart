import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/suggestion_repository.dart';
import 'blocs.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  final SuggestionRepository suggestionRepository;

  SuggestionBloc({required this.suggestionRepository})
      : super(SuggestionLoading()) {
    on<SuggestionLoad>((event, emit) async {
      emit(SuggestionLoading());
      try {
        final suggestions = await suggestionRepository.fetchAll();
        emit(SuggestionOperationSuccess(suggestions));
      } catch (error) {
        print(error);
        emit(SuggestionOperationFailure(error));
      }
    });

    on<SuggestionCreate>((event, emit) async {
      try {
        await suggestionRepository.create(event.suggestion);
        final suggestions = await suggestionRepository.fetchAll();
        emit(SuggestionOperationSuccess(suggestions));
      } catch (error) {
        emit(SuggestionOperationFailure(error));
      }
    });

    on<SuggestionDelete>((event, emit) async {
      try {
        await suggestionRepository.delete(event.id);
        final suggestions = await suggestionRepository.fetchAll();
        emit(SuggestionOperationSuccess(suggestions));
      } catch (error) {
        emit(SuggestionOperationFailure(error));
      }
    });
  }
}
