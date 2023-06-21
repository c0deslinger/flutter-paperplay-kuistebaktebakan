// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/modules/gameplay/controller/soal_controller.dart';
import 'package:flutter_getx_example/app/modules/gameplay/view/score_page.dart';
import 'package:flutter_getx_example/app/modules/menu/controller/menu_controller.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../utils/config_reader.dart';
import '../../../../utils/images_path.dart';
import '../model/soal.dart';
import '../widget/button_jawaban.dart';

class GameplayPage extends StatefulWidget {
  static const routeName = "/game/gameplay";

  GameplayPage({
    Key? key,
  }) : super(key: key);

  @override
  State<GameplayPage> createState() => _GameplayPageState();
}

class _GameplayPageState extends State<GameplayPage> {
  int jawabanBenar = 0;

  int jawabanSalah = 0;

  var indexSoal = 0.obs;

  var modeJawaban = "idle".obs;

  var lockJawaban = 9.obs;

  GameMenuController gameMenuController = Get.find();
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
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

  void loadInterstitialAd(Function onAdDismissed) {
    InterstitialAd.load(
      adUnitId: ConfigReader.getInterstitialAd(),
      request: const AdRequest(keywords: [
        'kids',
        'kids quiz',
        'funny quiz',
        'kids game',
        'kids trivia',
        'kids puzzle'
      ]),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              onAdDismissed();
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          debugPrint('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    loadBannerAd();
    loadInterstitialAd(() {
      Get.offNamed(ScoreScreen.routeName);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GetBuilder<SoalController>(builder: (controller) {
      var listSoal = controller.soal;
      if (listSoal.isEmpty) {
        return Container();
      }
      return Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImage.background_main),
                fit: BoxFit.cover)),
        child: Stack(children: [
          Positioned(
              right: 0,
              top: 40,
              child: Container(
                width: width / 1.4,
                height: width / 1.5,
                padding: const EdgeInsets.only(
                    top: 30, left: 25, right: 25, bottom: 50),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImage.item_bubble),
                        fit: BoxFit.fill)),
                child: Obx(
                  () => Text(
                    listSoal[indexSoal.value].isiSoal.capitalize!,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        AppImage.character_gameplay,
                        height: height / 3,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      width: width,
                      height: 20,
                      color: Colors.amberAccent,
                    ),
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImage.background_blue),
                                fit: BoxFit.cover)),
                        width: width,
                        height: height / 2.55,
                        child: Column(
                          children: [
                            Expanded(
                              child: animateItemButton(
                                  soal: Soal(
                                      isiSoal:
                                          listSoal[indexSoal.value].isiSoal,
                                      jawaban:
                                          listSoal[indexSoal.value].jawaban,
                                      pilihanA:
                                          "A. ${listSoal[indexSoal.value].pilihanA.capitalize!}",
                                      pilihanB:
                                          "B. ${listSoal[indexSoal.value].pilihanB.capitalize!}",
                                      pilihanC:
                                          "C. ${listSoal[indexSoal.value].pilihanC.capitalize!}",
                                      pilihanD:
                                          "D. ${listSoal[indexSoal.value].pilihanD.capitalize!}"),
                                  jawabanLock: lockJawaban.value,
                                  width: width,
                                  height: height,
                                  mode: (modeJawaban.value),
                                  onClick: (indexJawabanClick) async {
                                    lockJawaban.value = indexJawabanClick;
                                    modeJawaban.value = "lock";
                                    await Future.delayed(
                                        const Duration(seconds: 1));

                                    modeJawaban.value = "answered";
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    if (indexSoal.value <
                                        (listSoal.length - 1)) {
                                      // if (indexSoal.value < 1) {
                                      indexSoal.value++;
                                      lockJawaban.value = 5; // reset
                                      modeJawaban.value = "idle";
                                    } else {
                                      gameMenuController.setScore(
                                          controller.mapel,
                                          controller.level,
                                          jawabanBenar,
                                          jawabanSalah);
                                      if (_interstitialAd != null) {
                                        _interstitialAd?.show();
                                      } else {
                                        Get.offNamed(ScoreScreen.routeName);
                                      }

                                      debugPrint("Skor kamu $jawabanBenar");
                                    }
                                  },
                                  onRightAnswer: () {
                                    jawabanBenar++;
                                    debugPrint("Skor kamu $jawabanBenar");
                                  },
                                  onWrongAnswer: () {
                                    jawabanSalah++;
                                  }),
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
              ],
            ),
          )
        ]),
      ));
    });
  }
}
