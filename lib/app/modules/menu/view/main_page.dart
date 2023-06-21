import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/modules/menu/view/pilih_level_page.dart';
import 'package:flutter_getx_example/app/modules/menu/widget/setting_dialog.dart';
import 'package:get/get.dart';

import '../../../../utils/images_path.dart';
import '../controller/menu_controller.dart';
import '../widget/about_dialog.dart';
import '../widget/button_menu.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/menu/main";
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GameMenuController gameMenuController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                AppImage.background_main,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    left: width / 10, right: width / 10, top: 0),
                // color: Colors.red,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImage.item_title,
                            height: height / 3,
                            fit: BoxFit.fitHeight,
                          ),
                          const SizedBox(height: 20),
                          Image.asset(
                            AppImage.character_home,
                            height: height / 3.5,
                            fit: BoxFit.fitHeight,
                          ),
                          AnimatedButtonMenu(
                              label: "menu_start".tr,
                              context: context,
                              onClick: (_) {
                                gameMenuController.setMapel("Tebak Tebakan");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PilihLevelScreen()));
                              }),
                          AnimatedButtonMenu(
                            label: "menu_setting".tr,
                            context: context,
                            onClick: (_) {
                              showSettingDialog(context);
                            },
                          ),
                          AnimatedButtonMenu(
                              label: "menu_about".tr,
                              onClick: (_) {
                                showAboutGameDialog(context);
                              }),
                          AnimatedButtonMenu(
                              label: "exit_app".tr,
                              onClick: (_) {
                                Get.back();
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
