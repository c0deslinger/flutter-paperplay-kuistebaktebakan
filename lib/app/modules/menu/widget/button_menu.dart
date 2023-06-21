import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/images_path.dart';
import '../../../global/widget/outlined_text.dart';

class AnimatedButtonMenu extends StatelessWidget {
  AnimatedButtonMenu(
      {super.key,
      required this.label,
      this.onClick,
      this.marginBottom = 5,
      this.context,
      this.marginTop = 0});

  final String label;
  final Function? onClick;
  final double marginBottom;
  final BuildContext? context;
  final double marginTop;

  final buttonWidthRatio = 1.5.obs;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () async {
        buttonWidthRatio.value = 1.6; // mengecil
        await Future.delayed(const Duration(milliseconds: 100));
        buttonWidthRatio.value = 1.5; //normal
        if (onClick != null) onClick!(label);
        AssetsAudioPlayer.newPlayer().open(Audio("assets/audios/bubble.mp3"),
            showNotification: true, autoStart: true);
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(bottom: marginBottom, top: marginTop),
          width: width / buttonWidthRatio.value,
          height: (width / 1.5) / 5.5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppImage.button_menu,
                  width: width / buttonWidthRatio.value, fit: BoxFit.fitWidth),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: outlinedText(
                      text: label,
                      fontSize: 20,
                      textColor: Colors.white,
                      strokeColor: const Color.fromARGB(255, 219, 138, 26)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
