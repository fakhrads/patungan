import 'dart:ffi';

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

//tabel grup transaksi----------------------------------------------------
  //create
  static Future<int> createGroup(
    String nama_grup,
    String? catatan,
  ) async {
    final db = await SQLHelper.db();
    final dataGrup = {'nama_grup': nama_grup, 'catatan': catatan};
    final idGrup = await db.insert('grup_transaksi', dataGrup,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return idGrup;
  }

  //read all (journal)
  static Future<List<Map<String, dynamic>>> getGrup() async {
    final db = await SQLHelper.db();
    final idGrup = db.query('grup_transaksi', orderBy: "id_grup");
    return idGrup;
  }

  //update
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

//tabel peserta----------------------------------------------------
  //create
  static Future<int> createGroupPeserta(
    int id_grup,
    String nama_peserta,
  ) async {
    final db = await SQLHelper.db();
    final dataGrupPs = {'id_grup': id_grup, 'nama_peserta': nama_peserta};
    // final dataPeserta = {'nama_peserta': nama_peserta};
    final idGrupPs = await db.insert('peserta', dataGrupPs,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return idGrupPs;
  }

  //read all (journal)
  static Future<List<Map<String, dynamic>>> getGrupPeserta() async {
    final db = await SQLHelper.db();
    final idGrupPs = db.query('id_grup', orderBy: "id_grup");
    return idGrupPs;
  }

  //update
  static Future<int> updateGrupPeserta(
      int id_peserta, int id_grup, String nama_peserta) async {
    final db = await SQLHelper.db();

    final data = {
      // dihapus karena tidak akan mengubah grup nya juga
      // 'id_grup': id_grup,
      'nama_peserta': nama_peserta,
    };

    final result = await db.update('peserta', data,
        where: "id_peserta = ?", whereArgs: [id_peserta]);

    return result;
  }

  //delete
  static Future<void> deleteGrupPeserta(int id_peserta) async {
    final db = await SQLHelper.db();
    try {
      await db
          .delete("peserta", where: "id_peserta = ?", whereArgs: [id_peserta]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

//tabel split bills----------------------------------------------------
  // //create
  // static Future<int> createSplitBills(
  //   int id_grup,
  //   int id_peserta,
  //   String item,
  //   Double harga_item,
  //   Double sub_total,
  //   Double pajak,
  //   Double diskon,
  //   Double total_harga,
  // ) async {
  //   final db = await SQLHelper.db();
  //   final dataSB = {
  //     'id_grup': id_grup,
  //     'id_peserta': id_peserta,
  //     'item': item,
  //     'harga_item': harga_item,
  //     'sub_total': sub_total,
  //     'pajak': pajak,
  //     'diskon': diskon,
  //     'total_harga': total_harga,
  //   };
  //   // final dataPeserta = {'nama_peserta': nama_peserta};
  //   final idSB = await db.insert('split_bills', dataSB,
  //       conflictAlgorithm: sql.ConflictAlgorithm.replace);
  //   return idSB;
  // }

  // //read all (journal)
  // static Future<List<Map<String, dynamic>>> getSplitBills() async {
  //   final db = await SQLHelper.db();
  //   final idSB = db.query('id_split_bills', orderBy: "id_split_bills");
  //   return idSB;
  // }

  // //update
  // static Future<int> updateSplitBills(
  //   int id_split_bills,
  //   int id_grup,
  //   int id_peserta,
  //   String item,
  //   Double harga_item,
  //   Double sub_total,
  //   Double pajak,
  //   Double diskon,
  //   Double total_harga,
  // ) async {
  //   final db = await SQLHelper.db();

  //   final data = {
  //     // 'id_grup': id_grup,
  //     // 'id_peserta': id_peserta,
  //     'item': item,
  //     'harga_item': harga_item,
  //     'sub_total': sub_total,
  //     'pajak': pajak,
  //     'diskon': diskon,
  //     'total_harga': total_harga,
  //   };

  //   final result = await db.update('split_bills', data,
  //       where: "id_split_bills = ?", whereArgs: [id_split_bills]);

  //   return result;
  // }

  // //delete
  // static Future<void> deleteSplitBills(int id_split_bills) async {
  //   final db = await SQLHelper.db();
  //   try {
  //     await db.delete("split_bills",
  //         where: "id_split_bills = ?", whereArgs: [id_split_bills]);
  //   } catch (err) {
  //     debugPrint("Something went wrong when deleting an item: $err");
  //   }
  // }
}
