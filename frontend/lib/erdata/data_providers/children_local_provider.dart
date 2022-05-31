import 'dart:convert';
import 'package:http/http.dart' as http;
import 'children_data_provider.dart';
import '../models/model.dart';

class ChildrenDataProvider implements ChildrenProvider{
  @override
  Future<Children> create(Children children) async {
    const url = 'http://127.0.0.1:8000/erdata/children-create/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "first_name": children.first_name,
          "last_name": children.last_name,
          "gender": children.gender,
          "birth_date": children.birth_date,
          "description": children.description,
          "bank_account": children.bank_account,
          "kebele": children.kebele,
          "woreda": children.woreda,
          "zone": children.zone,
          "region": children.region,
          "photos": children.photos,
        }));

    if (response.statusCode == 201) {
      return Children.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception(response.body);
    }
  }

  @override
  Future<Children> fetchByid(int code) async {
    const url = 'http://127.0.0.1:8000/erdata/children';
    final response = await http.get(Uri.parse("$url/$code"));

    if (response.statusCode == 200) {
      return Children.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching children by id failed");
    }
  }

  @override
  Future<List<Children>> fetchAll() async {
    const url = 'http://127.0.0.1:8000/erdata/children/';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final children = jsonDecode(response.body) as List;
      return children.map((c) => Children.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch children");
    }
  }

  @override
  Future<Children> update(int id, Children children) async {
    const url = 'http://127.0.0.1:8000/erdata/children-up-del';
    final response = await http.put(Uri.parse("$url/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "first_name": children.first_name,
          "last_name": children.last_name,
          "gender": children.gender,
          "brith_date": children.birth_date,
          "description": children.description,
          "bank_account": children.bank_account,
          "kebele": children.kebele,
          "woreda": children.woreda,
          "zone": children.zone,
          "region": children.region,
          "photos": children.photos
        }));

    if (response.statusCode == 200) {
      return Children.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<void> delete(int id) async {
    const url = 'http://127.0.0.1:8000/erdata/children-up-del';
    final response = await http.delete(Uri.parse("$url/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the suggestion");
    }
  }
}
