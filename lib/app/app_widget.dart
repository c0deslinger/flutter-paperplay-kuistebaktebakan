// import 'package:easy_localization/easy_localization.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/global/controller/global_controller.dart';
import 'package:flutter_getx_example/app/modules/gameplay/controller/soal_controller.dart';
import 'package:flutter_getx_example/app/modules/menu/controller/menu_controller.dart';
import 'package:flutter_getx_example/app/modules/menu/view/main_page.dart';
import 'package:flutter_getx_example/locale/app_translation.dart';
import 'package:flutter_getx_example/app/routes/app_route.dart';
import 'package:flutter_getx_example/styles/app_themes.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalController globalController = Get.put(GlobalController());
  final GameMenuController gameMenuController = Get.put(GameMenuController());
  final SoalController soalController = Get.put(SoalController());
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
        init: globalController,
        builder: (appControllerVal) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: MainPage.routeName,
            locale: appControllerVal.locale,
            translations: AppTranslation(),
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appControllerVal.theme,
            getPages: AppRoute.pages,
            builder: (context, child) {
              // return Obx(() {
              //   if (networkStatusController.currentNetworkStatus.value ==
              //       NetworkStatus.offline) {
              //     return const ErrorPage(message: "Connection Error");
              //   }
              //   return child!;
              // });
              return child!;
            },
          );
        });
  }
}
