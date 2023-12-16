import 'package:flutter_fun/constants.dart';
import 'package:flutter_fun/state.management/getx/to.do/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "tasks";

  static Future<void> init() async {
    if (_db != null) {
      return;
    }
    try {
      String path = "${await getDatabasesPath()}tasks.db";
      logger.i("creating table");
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, note TEXT, date STRING,"
            " startTime STRING, endTime STRING, remind INTEGER, repeat STRING, color INTEGER, isCompleted INTEGER )",
          );
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  static Future<int> insert(Task? data) async {
    try {
      logger.i("inserting data ");
      logger.i(data?.toMap());
      int id = await _db!.insert(_tableName, data!.toMap());
      logger.i("inserted data $id");
      return id;
    } catch (e) {
      logger.e(e);
      return -1;
    }
  }

  static Future<List<Task>> queryAllTasks() async {
    try {
      logger.i("fetching data");

      final List<Map<String, dynamic>> maps = await _db!.query(_tableName);
      logger.i("fetched data ${maps.length}");
      logger.i(maps);
      return List.generate(maps.length, (index) => Task.fromMap(maps[index]));
    } catch (e) {
      logger.e(e);
      return [];
    }
  }

  static Future<int> updateTask(Task task) async {
    return _db!
        .update('tasks', task.toMap(), where: "id=?", whereArgs: [task.id]);
  }

  static Future<int> updateCompletedTask(int id) async {
    return _db!.rawUpdate("UPDATE tasks SET isCompleted = 1 WHERE id = $id");
  }

  static Future<int> deleteTask(int id) async {
    return _db!.delete('tasks', where: "id=?", whereArgs: [id]);
  }
}
