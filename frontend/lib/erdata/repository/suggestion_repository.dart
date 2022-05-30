import '../data_providers/suggestion_data_provider.dart';
import '../models/model.dart';

class SuggestionRepository {
  final SuggestionDataProvider dataProvider;
  SuggestionRepository(this.dataProvider);

  Future<Suggestion> create(Suggestion suggestion) async {
    return dataProvider.create(suggestion);
  }

  Future<List<Suggestion>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    dataProvider.delete(id);
  }
}