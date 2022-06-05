import 'package:erdata/account/models/model.dart';


abstract class UserProvider {
  Future<Registration> create(Registration user);
  
  Future<Registration> fetchByid(int id);
  Future<List<Registration>> fetchAll();
  Future<void> delete(int id);
}
