import 'dart:convert';
import '../models/model.dart';
import 'package:http/http.dart' as http;
import '../models/model.dart';

class UserBEDataProvider {
  Future<List<UserBE>> fetchAll() async {
    final url = 'http://127.0.0.1:8000/account/user-list/';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final user = jsonDecode(response.body) as List;
      return user.map((c) => UserBE.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch Userlist");
    }
  }
}
