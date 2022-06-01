import 'package:sec_2/admin/data_provider/user_data_provider.dart';
import 'package:sec_2/erdata/data_providers/data_provider.dart';

import 'package:sec_2/account/models/registration_model.dart';

class AdminRepository {
  UserProvider userProvider;
  AdminRepository(this.userProvider);

  @override
  Future<Registration> create(Registration user) async {
    final addedChild = Registration(
      id: user.id,
      password: user.password,
      password2: user.password2,
      username: user.username,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
    );
    return await userProvider.create(addedChild);
  }

  Future<Registration> fetchById(int id) async {
    return userProvider.fetchByid(id);
  }

  Future<List<Registration>> fetchAll() async {
    return userProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    userProvider.delete(id);
  }
}
