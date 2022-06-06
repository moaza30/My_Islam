import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/language/localization.dart';
import 'package:my_islamy/logic/controller/theme_controller.dart';
import 'package:my_islamy/routes/routes.dart';
import 'package:get/get.dart';
import 'consts/theme_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  runApp(const Islamy());
}

class Islamy extends StatelessWidget {
  const Islamy({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringManager.appName.tr,
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>("lang").toString()),
      fallbackLocale: const Locale(StringManager.enKey),
      translations: LocalizationApp(),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: AppRoutes.mainScreen,
      getPages: AppRoutes.routes,
    );
  }
}
