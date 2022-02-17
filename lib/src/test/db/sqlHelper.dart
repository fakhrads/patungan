import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';

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
  }

  Future<GrupTransaksi> create(GrupTransaksi grupTransaksi) async {
    final db = await instance.database;

    // final json = grupTransaksi.toJson();
    // final columns =
    //     '${GrupTransaksiFields.nama_grup}, ${GrupTransaksiFields.tgl_dibuat}, ${GrupTransaksiFields.catatan}';
    // final values =
    //     '${json[GrupTransaksiFields.nama_grup]}, ${json[GrupTransaksiFields.tgl_dibuat]}, ${json[GrupTransaksiFields.catatan]}';
    // final id_grup = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id_grup = await db.insert(tGrup, grupTransaksi.toJson());
    return grupTransaksi.copy(id_grup: id_grup);
  }

  Future<GrupTransaksi> readGrupTransaksi(int id_grup) async {
    final db = await instance.database;

    final maps = await db.query(
      tGrup,
      columns: GrupTransaksiFields.values,
      where: '${GrupTransaksiFields.id_grup} = ?',
      whereArgs: [id_grup],
    );

    if (maps.isNotEmpty) {
      return GrupTransaksi.fromJson(maps.first);
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

    db.close();
  }
}
