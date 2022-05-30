import '../data_providers/data_provider.dart';
import '../models/model.dart';

class ChildrenRepository {
  final ChildrenDataProvider dataProvider;
  ChildrenRepository(this.dataProvider);

  Future<Children> create(Children children) async {
    return dataProvider.create(children);
  }

  Future<Children> update(int id, Children children) async {
    return dataProvider.update(id, children);
  }

  Future<Children> fetchById(int id) async {
    return dataProvider.fetchByid(id);
  }

  Future<List<Children>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    dataProvider.delete(id);
  }
}