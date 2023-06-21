import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_example/utils/extensions.dart';

import '../../../../utils/images_path.dart';
import '../model/soal.dart';

Widget animateItemButton(
    {required Soal soal,
    int? jawabanLock,
    required double width,
    required double height,
    required String mode,
    required Function onRightAnswer,
    required Function onWrongAnswer,
    required Function onClick}) {
  int jawabanBenar = _convertJawabanIndex(soal.jawaban);
  List<String> options = [
    soal.pilihanA,
    soal.pilihanB,
    soal.pilihanC,
    soal.pilihanD,
  ];
  List<Widget> optWidget = [];
  debugPrint("-----");
  for (int n = 0; n < options.length; n++) {
    String buttonMode = "idle";

    if (mode == "answered" && n == jawabanBenar) {
      buttonMode = "right_anwer";
      if (jawabanBenar == jawabanLock) {
        onRightAnswer();
        AssetsAudioPlayer.newPlayer().open(Audio("assets/audios/jwb_benar.mp3"),
            showNotification: true, autoStart: true);
      } else {
        onWrongAnswer();
        AssetsAudioPlayer.newPlayer().open(Audio("assets/audios/buzz.wav"),
            showNotification: true, autoStart: true);
      }
    } else if (n == jawabanLock) {
      buttonMode = "lock";
    }
    optWidget.add(GestureDetector(
        onTap: () {
          if (mode == "idle") {
            onClick(n);
          }
        },
        child: _itemOption(
            answer: options[n], screenWidth: width, mode: buttonMode)));
  }
  return Column(children: optWidget);
}

_convertJawabanIndex(String jawaban) {
  switch (jawaban) {
    case "A":
      return 0;
    case "B":
      return 1;
    case "C":
      return 2;
    case "D":
      return 3;
  }
}

_itemOption(
    {required String answer,
    required double screenWidth,
    String mode = "idle"}) {
  return Container(
    width: screenWidth / 1.15,
    margin: const EdgeInsets.only(bottom: 5),
    height: 50,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        image: DecorationImage(
            image: (mode == "idle")
                ? const AssetImage(AppImage.item_button_jawaban)
                : (mode == "lock")
                    ? const AssetImage(AppImage.item_button_jawaban_lock)
                    : const AssetImage(AppImage.item_button_jawaban_benar),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(14)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          answer.capitalize(),
          style: TextStyle(fontSize: (answer.length > 40) ? 12 : 14),
        ),
      ],
    ),
  );
}
