import 'package:path/path.dart';
import 'package:patungan/src/test/model/pesertaTransaksi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';
import 'dart:convert';

class SQLHelper {
  static final SQLHelper instance = SQLHelper._init();

  static Database? _database;

  SQLHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('patungan.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $tGrup ( 
        ${GrupTransaksiFields.id_grup} $idType,
        ${GrupTransaksiFields.nama_grup} $textType,
        ${GrupTransaksiFields.tgl_dibuat} $textType,
        ${GrupTransaksiFields.catatan} $textType
      )

    ''');
    await db.execute(''' 
    CREATE TABLE $tPeserta (
        ${PesertaTransaksiFields.id_peserta} $idType,
        ${PesertaTransaksiFields.id_grup} $textType,
        ${PesertaTransaksiFields.nama_peserta} $textType,
        ${PesertaTransaksiFields.tgl_dibuat} $textType
      );''');
  }

  Future<GrupTransaksi> create(
      GrupTransaksi grupTransaksi, pesertaTransaksi) async {
    final db = await instance.database;
    print(grupTransaksi.toJson());
    final id_grup = await db.insert(tGrup, grupTransaksi.toJson());
    print(id_grup);
    for (Map m in pesertaTransaksi) {
      print(m["value'"]);
      db.insert(tPeserta, {
        "_id_grup": id_grup,
        "nama_peserta": m["value"],
        "tgl_dibuat": "Sekarang"
      });
    }

    //Batch batch = db.batch();
    //batch.insert(tPeserta, pesertaTransaksi.toJson());
    return grupTransaksi.copy(id_grup: id_grup);
  }

  Future<GrupTransaksi> readPesertaTransaksi(int id_grup) async {
    final db = await instance.database;

    final maps = await db.query(
      tPeserta,
      columns: PesertaTransaksiFields.values,
      where: '${PesertaTransaksiFields.id_grup} = ?',
      whereArgs: [id_grup],
    );

    if (maps.isNotEmpty) {
      return GrupTransaksi.fromJson(maps.first);
    } else {
      throw Exception('ID Group $id_grup not found');
    }
  }

  Future<GrupTransaksi> readGrupTransaksi(int? id_grup) async {
    print(id_grup);
    final db = await instance.database;

    final maps = await db.query(
      tGrup,
      columns: GrupTransaksiFields.values,
      where: '${GrupTransaksiFields.id_grup} = ?',
      whereArgs: [id_grup],
    );

    if (maps.isNotEmpty) {
      print(maps);
      return GrupTransaksi.fromJson(maps[0]);
    } else {
      throw Exception('ID Group $id_grup not found');
    }
  }

  Future<List<GrupTransaksi>> readAllGrupTransaksi() async {
    final db = await instance.database;

    final orderBy = '${GrupTransaksiFields.tgl_dibuat} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tGrup ORDER BY $orderBy');

    final result = await db.query(tGrup, orderBy: orderBy);

    return result.map((json) => GrupTransaksi.fromJson(json)).toList();
  }

  Future<int> update(GrupTransaksi grupTransaksi) async {
    final db = await instance.database;

    return db.update(
      tGrup,
      grupTransaksi.toJson(),
      where: '${GrupTransaksiFields.id_grup} = ?',
      whereArgs: [grupTransaksi.id_grup],
    );
  }

  Future<int> delete(int id_grup) async {
    final db = await instance.database;

    return await db.delete(
      tGrup,
      where: '${GrupTransaksiFields.id_grup} = ?',
      whereArgs: [id_grup],
    );
  }

  Future close() async {
    final db = await instance.database;
    _database = null;

    db.close();
  }
}
