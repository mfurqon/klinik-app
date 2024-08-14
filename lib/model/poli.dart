class Poli {
  String? id;
  String namaPoli;
  String jamBuka;
  String jamTutup;

  Poli(
      {this.id,
      required this.namaPoli,
      required this.jamBuka,
      required this.jamTutup});

  factory Poli.fromJson(Map<String, dynamic> json) => Poli(
      id: json["id"],
      namaPoli: json["nama_poli"],
      jamBuka: json["jam_buka"],
      jamTutup: json["jam_tutup"]);

  Map<String, dynamic> toJson() =>
      {"nama_poli": namaPoli, "jam_buka": jamBuka, "jam_tutup": jamTutup};
}
