import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/modules/menu/controller/menu_controller.dart';
import 'package:get/get.dart';

class MusicSetting extends StatefulWidget {
  @override
  _MusicSettingState createState() => _MusicSettingState();
}

class _MusicSettingState extends State<MusicSetting> {
  GameMenuController menuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameMenuController>(
      builder: (controller) => Row(
        children: [
          const Text(
            'Music',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Slider(
              value: controller.bgmVolume,
              min: 0,
              max: 1,
              onChanged: (value) {
                menuController.changeBgmVolume(value);
              },
            ),
          ),
          IconButton(
            icon: Icon(
              controller.isPlaying ? Icons.volume_off : Icons.volume_up,
              size: 30,
            ),
            onPressed: () {
              // setState(() {
              //   isPlaying = !isPlaying;
              // });
              // if (controller.getBgm().isPlaying.value) {
              //   controller.getBgm().stop();
              // } else {
              //   controller.getBgm().play();
              // }
              controller.stopBgm();
            },
          ),
        ],
      ),
    );
  }
}
