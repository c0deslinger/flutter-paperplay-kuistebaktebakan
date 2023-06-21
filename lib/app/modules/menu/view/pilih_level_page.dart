import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/modules/menu/controller/menu_controller.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../utils/config_reader.dart';
import '../../../../utils/images_path.dart';
import '../widget/button.dart';
import '../widget/button_woord.dart';
import '../../gameplay/controller/soal_controller.dart';
import '../../gameplay/view/gameplay_page.dart';

class PilihLevelScreen extends StatefulWidget {
  static const routeName = "/menu/level";
  const PilihLevelScreen({Key? key}) : super(key: key);

  @override
  State<PilihLevelScreen> createState() => _PilihLevelScreenState();
}

class _PilihLevelScreenState extends State<PilihLevelScreen> {
  int page = 1;

  var lastScore = [0, 0, 0, 0, 0].obs;
  SoalController soalController = Get.find();
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
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 209, 168, 1),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImage.background_main,
                ),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: width / 15),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Ribbon(label: "select_level".tr),
                          const SizedBox(height: 15),
                          GetBuilder<GameMenuController>(builder: (controller) {
                            return Column(
                              children: [
                                for (int n = 1;
                                    n <= controller.listScore.keys.length;
                                    n++)
                                  _scoreboard(
                                      level: n,
                                      lastScore: controller.listScore[n] ?? 0)
                              ],
                            );
                          })
                        ],
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

  _scoreboard({required int level, required int lastScore}) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<GameMenuController>(builder: (controller) {
              return Expanded(
                  child: AnimatedButtonWood(
                      label: "Level $level",
                      context: context,
                      marginBottom: 0,
                      onClick: (_) async {
                        await soalController.getSoal(
                            mapel: controller.mapel!, level: level);
                        Get.toNamed(GameplayPage.routeName);
                      }));
            }),
            const SizedBox(width: 5),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(
                lastScore.toString(),
                style: const TextStyle(fontSize: 20),
              )),
            )
          ],
        ),
      );
}
