import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class accessDatabase {
  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'patungan.db';
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }
}

void _createDb(Database db, int version) async {
  await db.execute('''
    CREATE TABLE `grup_transaksi` (
    `id_grup` int(11) NOT NULL AUTO_INCREMENT,
    `nama_grup` varchar(10) NOT NULL,
    `tgl_dibuat` date NOT NULL,
    `catatan` longtext,
    PRIMARY KEY (`id_grup`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1

  CREATE TABLE `peserta` (
    `id_peserta` int(11) NOT NULL AUTO_INCREMENT,
    `id_grup` int(11) NOT NULL,
    `nama_peserta` varchar(20) NOT NULL,
    PRIMARY KEY (`id_peserta`),
    KEY `id_grup` (`id_grup`),
    CONSTRAINT `fk_peserta` FOREIGN KEY (`id_grup`) REFERENCES `grup_transaksi` (`id_grup`) ON DELETE CASCADE ON UPDATE CASCADE
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1


  CREATE TABLE `split_bills` (
    `id_split_bills` int(11) NOT NULL AUTO_INCREMENT,
    `id_grup` int(11) NOT NULL,
    `id_peserta` int(11) NOT NULL,
    `item` varchar(20) NOT NULL,
    `harga_item` double NOT NULL,
    `sub_total` double NOT NULL,
    `pajak` double NOT NULL,
    `diskon` double NOT NULL,
    `total_harga` double NOT NULL,
    PRIMARY KEY (`id_split_bills`),
    KEY `id_grup` (`id_grup`),
    KEY `id_peserta` (`id_peserta`),
    CONSTRAINT `fk_split_bills_1` FOREIGN KEY (`id_grup`) REFERENCES `grup_transaksi` (`id_grup`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_split_bills_2` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`) ON DELETE CASCADE ON UPDATE CASCADE
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1
    ''');
}
