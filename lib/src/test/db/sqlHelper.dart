import 'package:path/path.dart';
import 'package:patungan/src/test/model/pesertaTransaksi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';
import 'package:patungan/src/test/model/splitBills.dart';
import 'package:patungan/src/test/model/tampungItems.dart';
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
    final doubleType = 'REAL NOT NULL';

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
        ${PesertaTransaksiFields.id_grup} $integerType,
        ${PesertaTransaksiFields.nama_peserta} $textType,
        ${PesertaTransaksiFields.tgl_dibuat} $textType
      );''');
    //id_split_bills, id_grup, id_peserta, item, harga_item,
    //sub_total, pajak, diskon, total_harga,
    await db.execute(''' 
    CREATE TABLE $tSplitBills (
        ${SplitBillsFields.id_split_bills} $idType,
        ${SplitBillsFields.id_grup} $integerType,
        ${SplitBillsFields.id_peserta} $integerType,
        ${SplitBillsFields.item} $textType,
        ${SplitBillsFields.harga_item} $doubleType,
        ${SplitBillsFields.pajak} $doubleType,
        ${SplitBillsFields.diskon} $doubleType
      );''');
    await db.execute(''' 
    CREATE TABLE $tItems (
        ${ItemsFields.id_item} $idType,
        ${ItemsFields.id_grup} $integerType,
        ${ItemsFields.nama_item} $textType,
        ${ItemsFields.harga_item} $doubleType,
        ${ItemsFields.jumlah_item} $integerType
      );''');
  }

  //==========================================grup

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
        "tgl_dibuat": "2022-02-18T13:59:26.074579"
      });
    }

    //Batch batch = db.batch();
    //batch.insert(tPeserta, pesertaTransaksi.toJson());
    return grupTransaksi.copy(id_grup: id_grup);
  }

  Future<List<PesertaTransaksi>> readPesertaTransaksi(int? id_grup) async {
    final db = await instance.database;

    final maps = await db.query(
      tPeserta,
      columns: PesertaTransaksiFields.values,
      where: '${PesertaTransaksiFields.id_grup} = ?',
      whereArgs: [id_grup],
    );

    if (maps.isNotEmpty) {
      return maps.map((json) => PesertaTransaksi.fromJson(json)).toList();
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

  /////peserta
  Future<int> deletePeserta(int id_peserta) async {
    final db = await instance.database;

    return await db.delete(
      tGrup,
      where: '${PesertaTransaksiFields.id_peserta} = ?',
      whereArgs: [id_peserta],
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

  //==========================================end of grup

  //==========================================split bills
  Future<SplitBills> createSplitBills(
      SplitBills splitBills, int id_grup, int id_peserta) async {
    final db = await instance.database;

    final json = splitBills.toJson();
    final columns =
        '${SplitBillsFields.id_grup}, ${SplitBillsFields.id_peserta}, ${SplitBillsFields.item}, ${SplitBillsFields.harga_item}, ${SplitBillsFields.pajak}, ${SplitBillsFields.diskon}';
    final values =
        '${json[GrupTransaksiFields.id_grup]}, ${json[PesertaTransaksiFields.id_peserta]}, ${json[SplitBillsFields.item]}, ${json[SplitBillsFields.harga_item]}, ${json[SplitBillsFields.pajak]}, ${json[SplitBillsFields.diskon]}';
    final id_sb = await db
        .rawInsert('INSERT INTO $tSplitBills ($columns) VALUES ($values)');

    // final id_grup = await db.insert(tGrup, grupTransaksi.toJson());
    return splitBills.copy(id_split_bills: id_sb);
  }

  Future<SplitBills> readSplitBills(int? id_split_bills) async {
    print(id_split_bills);
    final db = await instance.database;

    final maps = await db.rawQuery(
        'SELECT SUM(${SplitBillsFields.harga_item}) + (SUM(${SplitBillsFields.harga_item}) * (${SplitBillsFields.pajak} / 100)) - (SUM(${SplitBillsFields.harga_item}) * (${SplitBillsFields.diskon} / 100)) FROM $tSplitBills WHERE id_grup = ${SplitBillsFields.id_grup} AND id_peserta = ${SplitBillsFields.id_peserta}');

    // final maps = await db.query(
    //   tSplitBills,
    //   columns: SplitBillsFields.values,
    //   where: '${SplitBillsFields.id_split_bills} = ?',
    //   whereArgs: [id_split_bills],
    // );

    if (maps.isNotEmpty) {
      print(maps);
      return SplitBills.fromJson(maps[0]);
    } else {
      throw Exception('ID Group $id_split_bills not found');
    }
  }

  //==========================================end of split bills

  Future close() async {
    final db = await instance.database;
    _database = null;

    db.close();
  }
}
