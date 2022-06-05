import 'package:sec_2/erdata/data_providers/data_provider.dart';

import '../models/model.dart';

class ChildrenRepository {
  ChildrenDataProvider childrenProvider;
  ChildrenRepository(this.childrenProvider);

  Future<Children> create(Children children) async { 
    return await childrenProvider.create(children);
  }

  Future<Children> update(int id, Children children) async {
    
    return await childrenProvider.create(children);
  }

  Future<Children> fetchById(int id) async {
    return childrenProvider.fetchByid(id);
  }

  Future<List<Children>> fetchAll() async {
    return childrenProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    childrenProvider.delete(id);
  }
}
