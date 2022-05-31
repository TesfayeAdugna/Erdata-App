import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/model.dart';

class SuggestionDataProvider {
  Future<Suggestion> create(Suggestion suggestion) async {
    const url = 'http://127.0.0.1:8000/erdata/suggestion-create/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "child_name": suggestion.child_name,
          "gender": suggestion.gender,
          "birth_date": suggestion.brith_date,
          "description": suggestion.description,
          "suggested_by": suggestion.suggested_by
        }));

    if (response.statusCode == 200) {
      return Suggestion.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create suggestion");
    }
  }

  Future<Suggestion> fetchByCode(int code) async {
    const url = 'http://127.0.0.1:8000/erdata/suggestion-list';
    final response = await http.get(Uri.parse("$url/$code"));

    if (response.statusCode == 200) {
      return Suggestion.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching suggestion by code failed");
    }
  }

  Future<List<Suggestion>> fetchAll() async {
    const url = 'http://127.0.0.1:8000/erdata/suggestion-list/';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final suggestion = jsonDecode(response.body) as List;
      return suggestion.map((c) => Suggestion.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch suggestion");
    }
  }

  Future<void> delete(int id) async {
    const url = 'http://127.0.0.1:8000/erdata/suggestion';
    final response = await http.delete(Uri.parse("$url/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the suggestion");
    }
  }
}
