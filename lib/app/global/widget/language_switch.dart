import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/global/controller/global_controller.dart';
import 'package:get/get.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    String? currentLanguage = Get.locale!.languageCode;
    GlobalController globalController = Get.find();
    return Row(
      children: [
        Text(
          "language_label".tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(
          child: RadioListTile(
            title:
                Text("English", style: Theme.of(context).textTheme.bodyMedium),
            value: "en",
            groupValue: currentLanguage,
            onChanged: (value) {
              globalController.changeLanguage("en");
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: Text("Indo", style: Theme.of(context).textTheme.bodyMedium),
            value: "id",
            groupValue: currentLanguage,
            onChanged: (value) {
              globalController.changeLanguage("id");
            },
          ),
        ),
      ],
    );
  }
}
