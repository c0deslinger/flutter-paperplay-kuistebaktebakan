class DaftarSoal {
  DaftarSoal({
    required this.level1,
    required this.level2,
    required this.level3,
    required this.level4,
    required this.level5,
  });

  List<Soal> level1;
  List<Soal> level2;
  List<Soal> level3;
  List<Soal> level4;
  List<Soal> level5;

  factory DaftarSoal.fromJson(Map<String, dynamic> json) => DaftarSoal(
        level1: List<Soal>.from(json["level_1"].map((x) => Soal.fromJson(x))),
        level2: List<Soal>.from(json["level_2"].map((x) => Soal.fromJson(x))),
        level3: List<Soal>.from(json["level_3"].map((x) => Soal.fromJson(x))),
        level4: List<Soal>.from(json["level_4"].map((x) => Soal.fromJson(x))),
        level5: List<Soal>.from(json["level_5"].map((x) => Soal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "level_1": List<dynamic>.from(level1.map((x) => x.toJson())),
        "level_2": List<dynamic>.from(level2.map((x) => x.toJson())),
        "level_3": List<dynamic>.from(level3.map((x) => x.toJson())),
        "level_4": List<dynamic>.from(level4.map((x) => x.toJson())),
        "level_5": List<dynamic>.from(level5.map((x) => x.toJson())),
      };
}

class Soal {
  Soal({
    required this.isiSoal,
    required this.jawaban,
    required this.pilihanA,
    required this.pilihanB,
    required this.pilihanC,
    required this.pilihanD,
  });

  String isiSoal;
  String jawaban;
  String pilihanA;
  String pilihanB;
  String pilihanC;
  String pilihanD;

  factory Soal.fromJson(Map<String, dynamic> json) => Soal(
        isiSoal: json["isi_soal"],
        jawaban: json["jawaban"],
        pilihanA: json["pilihanA"],
        pilihanB: json["pilihanB"],
        pilihanC: json["pilihanC"],
        pilihanD: json["pilihanD"],
      );

  Map<String, dynamic> toJson() => {
        "isi_soal": isiSoal,
        "jawaban": jawaban,
        "pilihanA": pilihanA,
        "pilihanB": pilihanB,
        "pilihanC": pilihanC,
        "pilihanD": pilihanD,
      };
}
