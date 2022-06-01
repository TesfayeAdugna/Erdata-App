import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../data_providers/data_providers.dart';

class UserRepository {
  static String baseUrl = 'http://localhost:8000/account/login/';

  final FlutterSecureStorage localStrorage = FlutterSecureStorage();

  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await localStrorage.read(key: 'accessToken');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String accessToken) async {
    await localStrorage.write(key: "accessToken", value: accessToken);
  }

  Future<void> deleteToken() async {
    await localStrorage.delete(key: "accessToken");
    localStrorage.deleteAll();
  }

  Future<String> login(String username, String Password) async {
    Response response = await _dio
        .post(baseUrl, data: {'username': username, 'Password': Password});
    return response.data['accessToken'];
  }
}
