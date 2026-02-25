class ProdukModel {
  final int id;
  final String nama, kode, harga, foto;
  ProdukModel({required this.id, required this.nama, required this.kode, required this.harga, required this.foto});

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
      id: (json['id']),
      nama: json['nama'],
      kode: json['kode'],
      harga: json['harga'],
      foto: json['foto'],);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'kode': kode,
      'harga': harga,
      'foto': foto,
    };
  }
}