import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:convert';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
      CREATE TABLE grup_transaksi (
        id_grup INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nama_grup TEXT,
        tgl_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        catatan TEXT
      )
      """);
    await database.execute("""
      CREATE TABLE peserta (
        id_peserta INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        id_grup INTEGER,
        nama_peserta TEXT,
        FOREIGN KEY(id_grup) REFERENCES grup_transaksi (id_grup)
      )
      """);
    await database.execute("""
      CREATE TABLE split_bills (
        id_split_bills INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        id_grup INTEGER,
        id_peserta INTEGER,
        item TEXT,
        harga_item REAL,
        sub_total REAL,
        pajak REAL,
        diskon REAL,
        total_harga REAL,
        FOREIGN KEY(id_grup) REFERENCES grup_transaksi (id_grup),
        FOREIGN KEY(id_peserta) REFERENCES peserta (id_peserta)
      );
      """);
  }

  //create db
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'patungan.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  //create
  //static Future<List<int>> createGroup(String nama_grup, String? catatan, String nama_peserta) (JAN DIHAPUS)
  static Future<int> createGroup(String nama_grup, String? catatan) async {
    final db = await SQLHelper.db();
    final dataGrup = {'nama_grup': nama_grup, 'catatan': catatan};
    // final dataPeserta = {'nama_peserta': nama_peserta};
    final idGrup = await db.insert('grup_transaksi', dataGrup,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    // final idPeserta = await db.insert('peserta', dataPeserta,
    //     conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return idGrup;
  }

  //read all (journal)
  static Future<List<Map<String, dynamic>>> getGrup() async {
    final db = await SQLHelper.db();
    final idGrup = db.query('grup_transaksi', orderBy: "id_grup");
    // final idPeserta = db.query('peserta', orderBy: "id_peserta");
    return idGrup;
  }

  // //read single item by id
  // static Future<List<Map<String, dynamic>>> getItem(int id) async {
  //   final db = await SQLHelper.db();
  //   return db.query('items', where: "id = ?", whereArgs: [id], limit: 1); //bikin json
  // }

  //update
  //Future<int> updateGrup(int id_grup, int id_peserta, String nama_grup,
  //    String? catatan, String nama_peserta)
  static Future<int> updateGrup(
      int id_grup, String nama_grup, String? catatan) async {
    final db = await SQLHelper.db();

    final data = {
      'nama_grup': nama_grup,
      'catatan': catatan,
      // 'nama_peserta': nama_peserta,
      'tgl_dibuat': DateTime.now().toString()
    };

    final result = await db.update('grup_transaksi', data,
        where: "id_grup = ?", whereArgs: [id_grup]);

    return result;
  }

  //delete
  static Future<void> deleteGrup(int id_grup) async {
    final db = await SQLHelper.db();
    try {
      await db
          .delete("grup_transaksi", where: "id_grup = ?", whereArgs: [id_grup]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
