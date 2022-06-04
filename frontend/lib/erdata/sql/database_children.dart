import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';
import '../models/children_model.dart';
import 'package:sqlbrite/sqlbrite.dart';

class DatabaseHelper {
  //create the database
  static const _databaseName = "children.db";
  static const _databaseVersion = 1;

//create the table
  static const childrenTable = 'Children';
  static const id = 'id';

  static late BriteDatabase _streamDatabase;

  //private constructor
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static var lock = Lock();
//new field database
  static Database? _database;
//create column of the table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $childrenTable (
      $id INTEGER PRIMARY KEY AUTOINCREMENT,
      first_name TEXT;
      last_name TEXT;
      gender TEXT;
      photos TEXT;
      birth_date TEXT;
      description TEXT;
      bank_account TEXT;
      kebele TEXT;
      woreda TEXT;
      zone TEXT;
      region TEXT;
 )

} ''');
  }

  Future<Database> _initDatabase(String _databaseName) async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

//open the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase(_databaseName);
    return _database!;
  }

  Future<BriteDatabase> get streamDatabase async {
    await database;
    return _streamDatabase;
  }

  List<Children> parseChildren(List<Map<String, dynamic>> childrenList) {
    final children = <Children>[];
    childrenList.forEach((childMap) {
      final recipe = Children.fromJson(childMap);

      children.add(recipe);
    });

    return children;
  }

  Future<List<Children>> findAllChildren() async {
    final db = await instance.streamDatabase;

    final childrenList = await db.query(childrenTable);

    final children = parseChildren(childrenList);
    return children;
  }

  Stream<List<Children>> watchAllChildren() async* {
    final db = await instance.streamDatabase;

    yield* db
        .createQuery(childrenTable)
        .mapToList((row) => Children.fromJson(row));
  }

  Future<Children> findChildrenById(int id) async {
    final db = await instance.streamDatabase;
    final recipeList = await db.query(childrenTable, where: 'id = $id');
    final recipes = parseChildren(recipeList);
    return recipes.first;
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await instance.streamDatabase;

    return db.insert(table, row);
  }

  Future<int> insertChildren(Children children) {
    return insert(childrenTable, children.toJson());
  }

  Future<int> update(
      String table, Map<String, dynamic> row, int columnId) async {
    final db = await instance.streamDatabase;

    return db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateChildren(Children children) {
    return update(childrenTable, children.toJson(), children.id!);
  }

  Future<int> _delete(String table, String columnId, int id) async {
    final db = await instance.streamDatabase;
    return db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteChildren(Children children) async {
    if (children.id != null) {
      return _delete(childrenTable, id, children.id!);
    } else {
      return Future.value(-1);
    }
  }

  Future<void> close() async {
    _streamDatabase.close();
  }
  // Future close() async {
  //   final database = instance.database;
  //   database.
  // }
}
