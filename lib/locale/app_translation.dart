import 'package:flutter_getx_example/locale/id.dart';
import 'package:get/get.dart';

import 'en.dart';

class AppTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {"id": languageId, "en": languageEn};
}
