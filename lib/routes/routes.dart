import 'package:get/get.dart';
import 'package:my_islamy/logic/binding/azkar_binding.dart';
import 'package:my_islamy/logic/binding/main_binding.dart';
import 'package:my_islamy/logic/binding/quran_binding.dart';
import 'package:my_islamy/view/screens/main_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';
import 'package:my_islamy/view/screens/surah_screen.dart';
import 'package:my_islamy/view/widget/azkar_widget/azkar_details.dart';
import 'package:my_islamy/view/widget/quran_widget/juz_screen.dart';

import '../view/screens/setting_screen.dart';

class Routes {
  static const mainScreen = "/mainScreen";
  static const surahScreen = "/surahScreen";
  static const settingScreen = "/settingScreen";
  static const azkarScreen = "/azkarScreen";
  static const juzScreen = "/juzScreen";
}

class AppRoutes {
  static const mainScreen = Routes.mainScreen;

  static final routes = [
    GetPage(
      name: Routes.surahScreen,
      page: () => SurahScreen(),
      bindings: [
        QuranBinding(),
        MainBinding(),
      ],
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        MainBinding(),
        QuranBinding(),
        AzkarBinding(),
      ],
    ),
    GetPage(
      name: Routes.settingScreen,
      page: () => SettingScreen(),
      bindings: [
        MainBinding(),
      ],
    ),
    GetPage(
      name: Routes.azkarScreen,
      page: () => AzkarDetails(),
    ),
    GetPage(
      name: Routes.juzScreen,
      page: () => JuzScreen(),
    ),
  ];
}
