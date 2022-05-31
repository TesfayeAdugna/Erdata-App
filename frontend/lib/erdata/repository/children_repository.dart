import 'package:sec_2/erdata/data_providers/data_provider.dart';


import '../models/model.dart';

class ChildrenRepository {
  ChildrenDataProvider childrenProvider;
  ChildrenRepository(this.childrenProvider);

  Future<Children> create(Children children) async {
    final addedChild = Children(
      id: children.id,
      first_name: children.first_name,
     last_name: children.last_name, 
     photos: children.photos, 
     gender: children.gender,
      birth_date: children.birth_date, 
      description: children.description, 
      bank_account: children.bank_account, 
      kebele: children.kebele,
       region: children.region,
        woreda: children.woreda,
         zone: children.zone);
    return await childrenProvider.create(addedChild);
  }

  Future<Children> update(int id, Children children) async {
   final addedChild = Children(
     id: children.id,
     first_name: children.first_name,
     last_name: children.last_name, 
     photos: children.photos, 
     gender: children.gender,
      birth_date: children.birth_date, 
      description: children.description, 
      bank_account: children.bank_account, 
      kebele: children.kebele,
       region: children.region,
        woreda: children.woreda,
         zone: children.zone);
    return await childrenProvider.create(addedChild);
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