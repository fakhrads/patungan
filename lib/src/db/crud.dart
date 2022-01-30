import 'package:sqflite/sqflite.dart';
import 'class_penangkap.dart';
import 'access_database.dart';

class CRUD {
  accessDatabase dbHelper = new accessDatabase();

  Future<int> insert(classPenangkap todo) async {
    Database db = await dbHelper.initDb();
    int count = await db.insert('patungan', todo.toMap());
    return count;
  }
}
