import '../data_providers/data_providers.dart';
import '../models/model.dart';

class LoginRepository {
  final LoginDataProvider dataProvider;
  LoginRepository(this.dataProvider);

  Future<Login> create(Login login) async {
    return dataProvider.create(login);
  }
}
