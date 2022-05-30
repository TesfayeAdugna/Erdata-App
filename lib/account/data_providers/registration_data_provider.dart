import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/model.dart';

class RegistrationDataProvider {
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

  Future<Registration> update(int id, Registration registration) async {
    const url = 'http://127.0.0.1:8000/account/update/';
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
        throw Exception("Failed to update");
      }
  }
}
