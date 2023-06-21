import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/modules/gameplay/controller/soal_controller.dart';
import 'package:flutter_getx_example/app/modules/menu/controller/menu_controller.dart';
import 'package:flutter_getx_example/app/modules/menu/view/pilih_level_page.dart';
import 'package:flutter_getx_example/utils/config_reader.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../utils/images_path.dart';
import '../../menu/widget/button.dart';
import '../../menu/widget/button_woord.dart';

class ScoreScreen extends StatefulWidget {
  static const routeName = "/game/score";
  ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  final SoalController soalController = Get.find();

  final GameMenuController menuController = Get.find();

  late InterstitialAd? _interstitialAd;

  void _loadInterstitialAd(Function onAdDismissed) {
    InterstitialAd.load(
      adUnitId: ConfigReader.getInterstitialAd(),
      request: const AdRequest(),
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
    // _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //pindah di gameplay
    // _loadInterstitialAd(() {
    //   Get.back();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameMenuController>(builder: (controller) {
      int jawabanBenar = controller.jawabanBenar!;
      int jawabanSalah = controller.jawabanSalah!;
      String mapel = controller.mapel!;
      double nilai = jawabanBenar / (jawabanBenar + jawabanSalah) * 100;
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              color: Colors.blue[300],
              image: const DecorationImage(
                image: AssetImage(AppImage.background_score),
                fit: BoxFit.cover,
              )),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AppImage.item_triangle_green_header,
                  ),
                  Ribbon(label: "Skor Kamu")
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    // Image.asset(
                    //   AppImage.character_grade,
                    //   width: 100,
                    //   height: 200,
                    // ),
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            "Benar : $jawabanBenar",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.red),
                          ),
                          Text(
                            "Salah : $jawabanSalah",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.red),
                          ),
                          const SizedBox(height: 10),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                AppImage.item_grades_circle,
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                nilai.toInt().toString(),
                                style: const TextStyle(
                                    fontSize: 40, color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AnimatedButtonWood(
                  label: "Main Lagi",
                  context: context,
                  onClick: (_) {
                    Navigator.pop(context);
                  }),
              // const SizedBox(height: 10),
              // AnimatedButtonWood(
              //     label: "Kembali Ke Menu",
              //     context: context,
              //     onClick: (_) {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const MainPage()));
              //     }),
            ],
          ),
        ),
      );
    });
  }
}
