import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/model.dart';

class LoginDataProvider {
  Future<Login> create(Login login) async {
    const url = 'http://127.0.0.1:8000/account/login/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "username": login.username,
          "password": login.password
        }));

    if (response.statusCode == 200) {
      return Login.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to login");
    }
  }
}
