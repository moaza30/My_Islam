import 'package:get/get.dart';
import 'package:my_islamy/logic/binding/main_binding.dart';
import 'package:my_islamy/logic/binding/quran_binding.dart';
import 'package:my_islamy/view/screens/main_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';
import 'package:my_islamy/view/screens/surah_screen.dart';

class Routes {
  static const mainScreen = "/mainScreen";
  static const surahScreen = "/surahScreen";
}

class AppRoutes {
  static const mainScreen = Routes.mainScreen;

  static final routes = [
    GetPage(
      name: Routes.surahScreen,
      page: () => SurahScreen(),
      bindings: [
        QuranBinding(),
      ],
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        MainBinding(),
        QuranBinding(),
      ],
    ),
  ];
}
