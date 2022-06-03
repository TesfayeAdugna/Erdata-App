import '../models/children_model.dart';

abstract class ChildrenProvider {
  Future<Children> create(Children children);
  Future<Children> update(int id, Children children);
  Future<Children> fetchByid(int id);
  Future<List<Children>> fetchAll();
  Future<void> delete(int id);
}
