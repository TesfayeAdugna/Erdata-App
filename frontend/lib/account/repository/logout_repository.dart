import '../data_providers/data_providers.dart';

class LogoutRepository {
  final LogoutDataProvider dataProvider;
  LogoutRepository(this.dataProvider);

  Future create() async {
    return dataProvider.create();
  }
}
