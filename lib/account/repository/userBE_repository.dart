import '../models/user_model.dart';
import '../data_providers/data_providers.dart';

class UserBERepository {
  final UserBEDataProvider dataProvider;
  UserBERepository(this.dataProvider);

  Future<List<UserBE>> fetchAll() async {
    return dataProvider.fetchAll();
  }
}