import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_getx_example/utils/preferences.dart';
import 'package:get/get.dart';

class GameMenuController extends GetxController {
  String? mapel;
  int? level;
  int? jawabanBenar;
  int? jawabanSalah;
  DateTime? lastGetScore;

  AssetsAudioPlayer bgm = AssetsAudioPlayer();
  bool isPlaying = false;
  double bgmVolume = 1;

  GameMenuController() {
    bgm.open(Audio("assets/audios/bensound-ukulele.mp3"),
        loopMode: LoopMode.single);
  }

  void stopBgm() {
    if (bgm.isPlaying.value) {
      bgm.stop();
      isPlaying = false;
    } else {
      bgm.play();
      isPlaying = true;
    }
    update();
  }

  void changeBgmVolume(double value) {
    bgm.setVolume(value);
    bgmVolume = value;
    update();
  }

  void setLevel(int level) {
    this.level = level;
  }

  void setScore(
      String mapel, int level, int jawabanBenar, int jawabanSalah) async {
    await setLastScore(mapel, level,
        (jawabanBenar / (jawabanBenar + jawabanSalah) * 100).toInt());
    this.jawabanBenar = jawabanBenar;
    this.jawabanSalah = jawabanSalah;
    listScore[level] = await getLastScore(mapel, level);
    update();
  }

  //key is level, val is last score
  Map<int, int> listScore = {};

  void setMapel(String mapel) async {
    this.mapel = mapel;
    for (int n = 1; n <= 5; n++) {
      listScore[n] = await getLastScore(mapel, n);
    }
    lastGetScore = DateTime.now();
    update();
  }
}
