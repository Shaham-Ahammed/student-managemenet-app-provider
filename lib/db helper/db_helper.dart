import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart' as sql;

import 'package:student_app_provider/controllers/student_controller.dart';

import 'package:student_app_provider/model/student_model.dart';


class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
        """CREATE TABLE data(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
     name TEXT,
     age TEXT,
     phone TEXT,
     gender TEXT,
     images TEXT     
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      "data.db",
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createData(StudentModel studentModel,context) async {
    final db = await SQLHelper.db();
    final data = {
      "name": studentModel.name,
      "age": studentModel.age,
      "phone": studentModel.phone,
      "images": studentModel.images,
      "gender": studentModel.gender
    };
    final id = await db.insert("data", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    Provider.of<StudentController>(context, listen: false).fetchStudents();
       
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await SQLHelper.db();
    return db.query("data", orderBy: "id");
  }

  static Future<int> updateData(int id, StudentModel studentModel,context) async {
    final db = await SQLHelper.db();
    final data = {
      "name": studentModel.name,
      "age": studentModel.age,
      "phone": studentModel.phone,
      "images": studentModel.images,
      "gender": studentModel.gender
    };
    final result =
        await db.update("data", data, where: "id=?", whereArgs: [id]);
    Provider.of<StudentController>(context, listen: false).fetchStudents();
    return result;
  }

  static Future<void> deleteData(int id,context) async {
    final db = await SQLHelper.db();
    db.delete("data", where: "id=?", whereArgs: [id]);
   Provider.of<StudentController>(context, listen: false).fetchStudents();
  }
}
