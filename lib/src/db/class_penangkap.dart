class classPenangkap {
  String _nama_grup;
  String _catatan;
  String _nama_peserta;

  classPenangkap(this._nama_grup, this._catatan, this._nama_peserta);

  classPenangkap.fromMap(Map<String, dynamic> map) {
    this._nama_grup = map['nama_grup'];
    this._catatan = map['catatan'];
    this._nama_peserta = map['nama_peserta'];
  }

  String get nama_grup => _nama_grup;
  String get catatan => _catatan;
  String get nama_peserta => _nama_peserta;

  set nama_grup(String value) {
    _nama_grup = value;
  }

  set catatan(String value) {
    _catatan = value;
  }

  set nama_peserta(String value) {
    _nama_peserta = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['nama_grup'] = nama_grup;
    map['catatan'] = catatan;
    map['nama_peserta'] = nama_peserta;
    return map;
  }
}
