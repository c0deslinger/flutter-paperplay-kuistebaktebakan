import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/app_widget.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/config_reader.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await ConfigReader.initialize(env);
  await GetStorage.init();

  runApp(MyApp());
}
