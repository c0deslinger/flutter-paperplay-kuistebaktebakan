import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/images_path.dart';
import '../../../../utils/static_var.dart';
import 'button_woord.dart';

// ignore: slash_for_doc_comments
/**
 * Still progress
 */
class AboutDialog extends StatelessWidget {
  final Image image;
  final int width;
  final int height;

  const AboutDialog(
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 10, right: 20),
                        child: Image.asset(AppImage.item_about),
                      ),
                      const SizedBox(height: 10),
                      const Text("Developer: Yusuf Fachroni",
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 5),
                      const Text("BGM: Ukulele - Bendsound.com",
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 10),
                      AnimatedButtonWood(
                          label: "Game Lainnya",
                          context: context,
                          onClick: (_) async {
                            String url =
                                "https://play.google.com/store/apps/dev?id=8152103288885796153";
                            await launchUrl(Uri.parse(url));
                          }),
                      const SizedBox(height: 5),
                      AnimatedButtonWood(
                        label: "Kritik & Saran",
                        context: context,
                        onClick: (_) async {
                          final Uri params = Uri(
                            scheme: 'mailto',
                            path: 'paperplay.inc@gmail.com',
                            queryParameters: {
                              'subject': 'kuistebaktebakan',
                            },
                          );

                          await launchUrl(params);
                        },
                      ),
                      const SizedBox(height: 5),
                      AnimatedButtonWood(
                          label: "Profil Developer",
                          context: context,
                          onClick: (_) async {
                            String url =
                                "https://www.linkedin.com/in/yusuf-fachroni/";
                            await launchUrl(Uri.parse(url));
                          }),
                      const SizedBox(height: 5),
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

showAboutGameDialog(BuildContext context) {
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
                  AboutDialog(image: image, width: width, height: height)));
    }));
  }
}
