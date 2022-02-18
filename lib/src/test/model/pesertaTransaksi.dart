final String tPeserta = 'peserta_transaksi';

class PesertaTransaksiFields {
  static final List<String> values = [
    //add all fields
    id_grup, id_peserta, nama_peserta, tgl_dibuat
  ];

  static final String id_grup = '_id_grup';
  static final String id_peserta = 'id_peserta';
  static final String nama_peserta = 'nama_peserta';
  static final String tgl_dibuat = 'tgl_dibuat';
}

class PesertaTransaksi {
  final int? id_grup;
  final int? id_peserta;
  final String nama_peserta;
  final DateTime createdTime;

  const PesertaTransaksi({
    this.id_peserta,
    required this.id_grup,
    required this.createdTime,
    required this.nama_peserta,
  });

  static PesertaTransaksi fromJson(Map<String, Object?> json) =>
      PesertaTransaksi(
        id_grup: json[PesertaTransaksiFields.id_grup] as int?,
        id_peserta: json[PesertaTransaksiFields.id_peserta] as int?,
        nama_peserta: json[PesertaTransaksiFields.nama_peserta] as String,
        createdTime:
            DateTime.parse(json[PesertaTransaksiFields.tgl_dibuat] as String),
      );

  Map<String, Object?> toJson() => {
        PesertaTransaksiFields.id_grup: id_grup,
        PesertaTransaksiFields.id_peserta: id_peserta,
        PesertaTransaksiFields.nama_peserta: nama_peserta,
        PesertaTransaksiFields.tgl_dibuat: createdTime.toIso8601String(),
      };

  PesertaTransaksi copy({
    int? id_grup,
    int? id_peserta,
    String? nama_peserta,
    DateTime? createdTime,
  }) =>
      PesertaTransaksi(
        id_grup: id_grup ?? this.id_grup,
        id_peserta: id_peserta ?? this.id_peserta,
        nama_peserta: nama_peserta ?? this.nama_peserta,
        createdTime: createdTime ?? this.createdTime,
      );
}
