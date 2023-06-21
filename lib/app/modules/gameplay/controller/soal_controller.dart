import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/soal.dart';

abstract class ISoalController {
  Future<void> getSoal({required String mapel, required int level});
}

class SoalController extends GetxController implements ISoalController {
  String mapel = "";
  int level = 0;
  List<Soal> soal = [];

  @override
  Future<void> getSoal({required String mapel, required int level}) async {
    this.level = level;
    this.mapel = mapel;
    debugPrint("begin to get soal $mapel with level $level");

    var data = await rootBundle.loadString(
        'assets/document/${mapel.toLowerCase().replaceAll(" ", "_")}.json');

    var jsonResult = json.decode(data);
    DaftarSoal daftarSoal = DaftarSoal.fromJson(jsonResult);

    switch (level) {
      case 1:
        soal = daftarSoal.level1;
        break;
      case 2:
        soal = daftarSoal.level2;
        break;
      case 3:
        soal = daftarSoal.level3;
        break;
      case 4:
        soal = daftarSoal.level4;
        break;
      case 5:
        soal = daftarSoal.level5;
        break;
    }
    update();
  }
}
