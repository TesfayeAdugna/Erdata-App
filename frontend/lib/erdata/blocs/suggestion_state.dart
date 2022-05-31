import 'package:equatable/equatable.dart';

import '../models/suggestion.dart';

abstract class SuggestionState extends Equatable {
  const SuggestionState();

  @override
  List<Object> get props => [];
}

class SuggestionLoading extends SuggestionState {}

class SuggestionOperationSuccess extends SuggestionState {
  final Iterable<Suggestion> suggestions;

  const SuggestionOperationSuccess([this.suggestions = const []]);

  @override
  List<Object> get props => [suggestions];
}

class SuggestionOperationFailure extends SuggestionState {
  final Object error;

  const SuggestionOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}