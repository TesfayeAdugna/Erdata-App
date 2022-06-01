import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sec_2/account/models/registration_model.dart';
import 'package:sec_2/admin/data_provider/user_data_provider.dart';

class UserDataProvider implements UserProvider{
  Future<Registration> create(Registration registration) async {
    const url = 'http://127.0.0.1:8000/account/register/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "username": registration.username,
          "password": registration.password,
          "password2": registration.password2,
          "first_name": registration.first_name,
          "last_name": registration.last_name,
          "email": registration.email
        }));

    if (response.statusCode == 200) {
      return Registration.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to register");
    }
  }

   @override
  Future<Registration> fetchByid(int code) async {
    const url = 'http://127.0.0.1:8000/erdata/children';
    final response = await http.get(Uri.parse("$url/$code"));

    if (response.statusCode == 200) {
      return Registration.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching children by id failed");
    }
  }

  @override
  Future<List<Registration>> fetchAll() async {
    const url = 'http://127.0.0.1:8000/erdata/children/';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      return users.map((c) => Registration.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch children");
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
