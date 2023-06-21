import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/modules/menu/controller/menu_controller.dart';
import 'package:flutter_getx_example/app/modules/menu/view/pilih_level_page.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../utils/config_reader.dart';
import '../widget/button.dart';
import '../widget/button_woord.dart';

class PilihMapelScreen extends StatefulWidget {
  static const routeName = "/menu/mapel";
  const PilihMapelScreen({Key? key}) : super(key: key);

  @override
  State<PilihMapelScreen> createState() => _PilihMapelScreenState();
}

class _PilihMapelScreenState extends State<PilihMapelScreen> {
  int page = 1;
  GameMenuController gameMenuController = Get.find();
  BannerAd? _bannerAd;

  void loadBannerAd() {
    BannerAd(
      adUnitId: ConfigReader.getBannerAd(),
      request: const AdRequest(keywords: [
        'kids',
        'kids quiz',
        'funny quiz',
        'kids game',
        'kids trivia',
        'kids puzzle'
      ]),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void initState() {
    loadBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 192, 255, 1),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background/background_blue.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: menu(page,
                            arrowButton: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _arrowButton("prev"),
                                  _arrowButton("next"),
                                ],
                              ),
                            )),
                      ),
                    ),
                    if (_bannerAd != null)
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: _bannerAd!.size.width.toDouble(),
                          height: _bannerAd!.size.height.toDouble(),
                          child: AdWidget(ad: _bannerAd!),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _arrowButton(String mode) {
    if (mode == "next") {
      return (page == 3)
          ? Container()
          : GestureDetector(
              onTap: () {
                AssetsAudioPlayer.newPlayer().open(
                    Audio("assets/audios/bubble.mp3"),
                    showNotification: true,
                    autoStart: true);
                if (page < 3) {
                  page++;
                  setState(() {});
                }
              },
              child: Image.asset(
                "assets/images/item/button_next.png",
                width: 50,
                height: 50,
              ),
            );
    } else {
      return (page == 1)
          ? Container()
          : GestureDetector(
              onTap: () {
                AssetsAudioPlayer.playAndForget(
                    Audio("assets/audios/bubble.mp3"));
                // AssetsAudioPlayer.newPlayer().open(
                //     Audio("assets/audios/bubble.mp3"),
                //     showNotification: false,
                //     autoStart: false);
                if (page > 1) {
                  page--;
                  setState(() {});
                }
              },
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14),
                child: Image.asset(
                  "assets/images/item/button_next.png",
                  width: 50,
                  height: 50,
                ),
              ),
            );
    }
  }

  List<Widget> menu(int page,
      {double marginBottom = 5, required Widget arrowButton}) {
    woodButton(String mapel) => AnimatedButtonWood(
        label: mapel,
        marginBottom: 10,
        context: context,
        onClick: (label) {
          gameMenuController.setMapel(mapel);
          Get.toNamed(PilihLevelScreen.routeName);
        });

    return (page == 1)
        ? [
            Ribbon(label: "Pilih Soal"),
            const SizedBox(height: 15),
            woodButton("Matematika"),
            woodButton("IPA Dasar"),
            woodButton("IPS Dasar"),
            woodButton("Sejarah"),
            woodButton("Bahasa"),
            woodButton("Kewarganegaraan"),
            arrowButton,
          ]
        : (page == 2)
            ? [
                Ribbon(label: "Pilih Soal"),
                const SizedBox(height: 15),
                woodButton("Kimia"),
                woodButton("Fisika"),
                woodButton("Biologi"),
                woodButton("Logika"),
                woodButton("Tebak Tebakan"),
                woodButton("Tokoh"),
                arrowButton,
              ]
            : [
                Ribbon(label: "Pilih Soal"),
                const SizedBox(height: 15),
                woodButton("Bahasa Inggris"),
                woodButton("Geografi"),
                woodButton("Ekonomi"),
                woodButton("Agama Islam"),
                woodButton("Komputer"),
                arrowButton
              ];
  }
}
