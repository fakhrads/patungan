final String tItems = 'items';

class ItemsFields {
  static final List<String> values = [
    //add all fields
    id_grup,
    id_item,
    nama_item,
    harga_item,
    jumlah_item,
    // sub_total, total_harga,
  ];

  static final String id_grup = '_id_grup';
  static final String id_item = 'id_item';
  static final String nama_item = 'nama_item';
  static final String harga_item = 'harga_item';
  static final String jumlah_item = 'jumlah_item';
}

class Items {
  final int? id_grup;
  final int? id_item;
  final String nama_item;
  final double harga_item;
  // final double sub_total;
  final int jumlah_item;

  const Items({
    this.id_item,
    required this.id_grup,
    required this.nama_item,
    required this.harga_item,
    required this.jumlah_item,
  });

  static Items fromJson(Map<String, Object?> json) => Items(
        id_grup: json[ItemsFields.id_grup] as int?,
        id_item: json[ItemsFields.id_item] as int?,
        nama_item: json[ItemsFields.nama_item] as String,
        harga_item: json[ItemsFields.harga_item] as double,
        jumlah_item: json[ItemsFields.jumlah_item] as int,
      );

  Map<String, Object?> toJson() => {
        ItemsFields.id_grup: id_grup,
        ItemsFields.id_item: id_item,
        ItemsFields.nama_item: nama_item,
        ItemsFields.harga_item: harga_item,
        ItemsFields.jumlah_item: jumlah_item,
      };

  Items copy({
    int? id_grup,
    int? id_item,
    String? nama_item,
    double? harga_item,
    int? jumlah_item,
  }) =>
      Items(
        id_grup: id_grup ?? this.id_grup,
        id_item: id_item ?? this.id_item,
        nama_item: nama_item ?? this.nama_item,
        harga_item: harga_item ?? this.harga_item,
        jumlah_item: jumlah_item ?? this.jumlah_item,
      );
}
