// import 'package:sec_2/erdata/sql/database_children.dart';
// import 'package:sec_2/erdata/data_providers/children_local_provider.dart';
// import 'package:sec_2/erdata/models/children_model.dart';
// import 'package:sec_2/erdata/repository/children_repository.dart';

// class SqlRepository extends ChildrenRepository {
//   final databaseHelper = DatabaseHelper.instance;

//   SqlRepository(ChildrenDataProvider childrenProvider)
//       : super(childrenProvider);

//   Future<List<Children>> findAllChildren() {
//     return databaseHelper.findAllChildren();
//   }

//   Stream<List<Children>> watchAllChildren() {
//     return databaseHelper.watchAllChildren();
//   }

//   Future<Children> findChildrenById(id) {
//     return databaseHelper.findChildrenById(id);
//   }

//   @override
//   Future<List<int>> insertChildren(List<Children> childrens) {
//     return Future(() async {
//       if (childrens.length != 0) {
//         // 1
//         final childrenIds = <int>[];
//         // 2
//         await Future.forEach(childrens, (Children children) async {
//           // 3
//           final futureId = await databaseHelper.insertChildren(children);
//           children.id = futureId;
//           // 4
//           childrenIds.add(futureId);
//         });
//         // 5
//         return Future.value(childrenIds);
//       } else {
//         return Future.value(<int>[]);
//       }
//     });
//   }

//   @override
//   Future<void> deleteChildren(Children children) {
//     databaseHelper.deleteChildren(children);
//     // 3
//     return Future.value();
//   }

//   @override
//   Future init() async {
//     // 1
//     await databaseHelper.database;
//     return Future.value();
//   }

//   @override
//   void close() {
//     // 2
//     databaseHelper.close();
//   }
// }
