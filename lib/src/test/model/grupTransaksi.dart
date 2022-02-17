final String tGrup = 'grup_transaksi';

class GrupTransaksiFields {
  static final List<String> values = [
    //add all fields
    id_grup, nama_grup, tgl_dibuat, catatan,
  ];

  static final String id_grup = '_id_grup';
  static final String nama_grup = 'nama_grup';
  static final String tgl_dibuat = 'tgl_dibuat';
  static final String catatan = 'catatan';
}

class GrupTransaksi {
  final int? id_grup;
  final String nama_grup;
  final DateTime createdTime;
  final String catatan;

  const GrupTransaksi({
    this.id_grup,
    required this.nama_grup,
    required this.createdTime,
    required this.catatan,
  });

  static GrupTransaksi fromJson(Map<String, Object?> json) => GrupTransaksi(
        id_grup: json[GrupTransaksiFields.id_grup] as int?,
        nama_grup: json[GrupTransaksiFields.nama_grup] as String,
        createdTime:
            DateTime.parse(json[GrupTransaksiFields.tgl_dibuat] as String),
        catatan: json[GrupTransaksiFields.catatan] as String,
      );

  Map<String, Object?> toJson() => {
        GrupTransaksiFields.id_grup: id_grup,
        GrupTransaksiFields.nama_grup: nama_grup,
        GrupTransaksiFields.tgl_dibuat: createdTime.toIso8601String(),
        GrupTransaksiFields.catatan: catatan,
      };

  GrupTransaksi copy({
    int? id_grup,
    String? nama_grup,
    DateTime? createdTime,
    String? catatan,
  }) =>
      GrupTransaksi(
        id_grup: id_grup ?? this.id_grup,
        nama_grup: nama_grup ?? this.nama_grup,
        createdTime: createdTime ?? this.createdTime,
        catatan: catatan ?? this.catatan,
      );
}
