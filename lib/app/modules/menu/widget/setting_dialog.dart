import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../utils/images_path.dart';
import '../../../../utils/static_var.dart';
import '../../../global/widget/outlined_text.dart';
import 'button_woord.dart';
import 'music_setting.dart';

// ignore: slash_for_doc_comments
/**
 * Still progress
 */
class SettingDialog extends StatelessWidget {
  final Image image;
  final int width;
  final int height;

  const SettingDialog(
      {Key? key,
      required this.image,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(dialogBackgroundColor: Colors.transparent),
      child: Builder(builder: (context) {
        return Dialog(
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: width / height,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: image.image, fit: BoxFit.fill)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      outlinedText(
                          text: "Pengaturan",
                          fontSize: 30,
                          textColor: Colors.white,
                          strokeColor: const Color.fromARGB(255, 219, 138, 26)),
                      const SizedBox(height: 5),
                      MusicSetting(),
                      const SizedBox(height: 30),
                      AnimatedButtonWood(
                          label: "Tutup",
                          context: context,
                          onClick: (_) {
                            AppStatic.dialogShowed = false;
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

showSettingDialog(BuildContext context) {
  //test
  // CfundGlobalVars.showBannerPromotion = true;
  if (!AppStatic.dialogShowed) {
    AppStatic.dialogShowed = true;

    Image image = Image.asset(AppImage.background_board);

    int width = 0, height = 0;

    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((info, call) {
      width = info.image.width;
      height = info.image.height;
      Future.delayed(
          Duration.zero,
          () => showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) =>
                  SettingDialog(image: image, width: height, height: height)));
    }));
  }
}
