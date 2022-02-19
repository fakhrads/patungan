final String tSplitBills = 'split_bills';

class SplitBillsFields {
  static final List<String> values = [
    //add all fields
    id_split_bills, id_grup, id_peserta, item, harga_item,
    pajak, diskon,
    // sub_total, total_harga,
  ];

  static final String id_grup = '_id_grup';
  static final String id_split_bills = 'id_split_bills';
  static final String id_peserta = 'id_peserta';
  static final String item = 'item'; //
  static final String harga_item = 'harga_item';
  // static final String sub_total = 'sub_total';
  static final String pajak = 'pajak';
  static final String diskon = 'diskon';
  // static final String total_harga = 'total_harga';
}

class SplitBills {
  final int? id_grup;
  final int? id_split_bills;
  // final double sub_total;
  final double pajak;
  final double diskon;
  // final double total_harga;

  const SplitBills({
    this.id_split_bills,
    required this.id_grup,
    // required this.sub_total,
    required this.pajak,
    required this.diskon,
    // required this.total_harga,
  });

  static SplitBills fromJson(Map<String, Object?> json) => SplitBills(
        id_grup: json[SplitBillsFields.id_grup] as int?,
        id_split_bills: json[SplitBillsFields.id_split_bills] as int?,

        // sub_total: json[SplitBillsFields.sub_total] as double,
        pajak: json[SplitBillsFields.pajak] as double,
        diskon: json[SplitBillsFields.diskon] as double,
        // total_harga: json[SplitBillsFields.total_harga] as double,
      );

  Map<String, Object?> toJson() => {
        SplitBillsFields.id_grup: id_grup,
        SplitBillsFields.id_split_bills: id_split_bills,
        // SplitBillsFields.sub_total: sub_total,
        SplitBillsFields.pajak: pajak,
        SplitBillsFields.diskon: diskon,
        // SplitBillsFields.total_harga: total_harga,
      };

  SplitBills copy({
    int? id_grup,
    int? id_split_bills,
    // double? sub_total,
    double? pajak,
    double? diskon,
    // double? total_harga,
  }) =>
      SplitBills(
        id_grup: id_grup ?? this.id_grup,
        id_split_bills: id_split_bills ?? this.id_split_bills,
        // sub_total: sub_total ?? this.sub_total,
        pajak: pajak ?? this.pajak,
        diskon: diskon ?? this.diskon,
        // total_harga: total_harga ?? this.total_harga,
      );
}
