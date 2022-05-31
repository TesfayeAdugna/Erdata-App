import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/model.dart';

class LogoutDataProvider {
  Future create() async {
    const url = 'http://127.0.0.1:8000/account/logout/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},);
  }
}
