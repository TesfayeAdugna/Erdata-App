import '../data_providers/data_providers.dart';
import '../models/model.dart';

class RegistrationRepository {
  final RegistrationDataProvider dataProvider;
  RegistrationRepository(this.dataProvider);

  Future<Registration> create(Registration registration) async {
    return dataProvider.create(registration);
  }
  Future<Registration> update(int id, Registration registration) async {
    return dataProvider.update(id, registration);
  }
  }

