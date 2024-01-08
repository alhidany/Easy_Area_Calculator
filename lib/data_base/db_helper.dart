import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

class DBHelper with ChangeNotifier {
  int x = 5;
  //DBHelper();
  DBHelper._();
  static Database? _database;
  static final dbHelper = DBHelper._();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  Future initDB() async {
    io.Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, "areadb.db");
    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE area(id Integer  Primary key Autoincrement Not null, a float(9,2) ,b float(9,2) ,c float(9,2),total float(9,2),state Integer)");

      //NOT NULL AUTO_INCREMENT
    });
  }

  Future insertData({required String tableName, model}) async {
    final db = await database;
    db?.insert(tableName, model);
  }

  Future updateData({required String tableName, model, id}) async {
    final db = await database;
    db?.update(tableName, model, where: 'id=?', whereArgs: [id]);
  }

  Future selectData({required String tableName}) async {
    final db = await database;
    var result = await db?.rawQuery("Select * from $tableName");
    if (result != null) {
      return result;
    } else {
      return "No Data---<>>>>>";
    }
  }

  Future selectSpecifcdata({required String tableName, required String id}) async {
    final db = await database;
    var result = await db?.rawQuery("Select * from $tableName where id= $id");
    if (result != null) {
      return result;
    } else {
      return "No Data---<>>>>>";
    }
  }

  Future selectTotal({required String tableName}) async {
    final db = await database; //,count([price]) as counter
    var result = await db?.rawQuery("select sum([total]) as total from $tableName ");
    if (result != null) {
      return result;
    } else {
      return 0;
    }
  }

  Future deletOneRowFromAnyTable({required String tableName, required String id}) async {
    final db = await database; //,count([price]) as counter
    var result = await db?.rawDelete("DELETE from $tableName where id= $id");
    return "Delete data from data base>>$result";
  }

  Future deletallRowFromAnyTable({required String tableName}) async {
    final db = await database; //,count([price]) as counter
    var result = await db?.rawDelete("DELETE from $tableName");
    return "Delete data from data base>>$result";
  }
}
