import 'package:equatable/equatable.dart';

import '../models/suggestion.dart';

abstract class SuggestionEvent extends Equatable {
  const SuggestionEvent();
}

class SuggestionLoad extends SuggestionEvent {
  const SuggestionLoad();

  @override
  List<Object> get props => [];
}

class SuggestionCreate extends SuggestionEvent {
  final Suggestion suggestion;

  const SuggestionCreate(this.suggestion);

  @override
  List<Object> get props => [suggestion];

  @override
  String toString() => 'Suggestion Created {Suggestion Id: ${suggestion.id}}';
}

class SuggestionDelete extends SuggestionEvent {
  final int id;

  const SuggestionDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Suggestion Deleted {Suggestion Id: $id}';

  @override
  bool? get stringify => true;
}