import 'package:flutter_getx_example/app/modules/gameplay/view/gameplay_page.dart';
import 'package:flutter_getx_example/app/modules/gameplay/view/score_page.dart';
import 'package:flutter_getx_example/app/modules/menu/view/main_page.dart';
import 'package:flutter_getx_example/app/modules/menu/view/pilih_level_page.dart';
import 'package:flutter_getx_example/app/modules/menu/view/pilih_mapel_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static final pages = [
    GetPage(name: MainPage.routeName, page: () => const MainPage()),
    GetPage(
        name: PilihMapelScreen.routeName, page: () => const PilihMapelScreen()),
    GetPage(
        name: PilihLevelScreen.routeName, page: () => const PilihLevelScreen()),
    GetPage(name: GameplayPage.routeName, page: () => GameplayPage()),
    GetPage(name: ScoreScreen.routeName, page: () => ScoreScreen()),
  ];
}
