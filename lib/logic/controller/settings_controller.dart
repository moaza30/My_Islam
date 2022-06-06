import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_islamy/consts/string_manager.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var languageLocale = StringManager.enKey;

  // Change Application language
  @override
  void onInit() async {
    super.onInit();
    languageLocale = await getLanguage;
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  Future<String> get getLanguage async {
    return await storage.read("lang");
  }

  void changeLanguage(String lang) {
    saveLanguage(lang);
    if (languageLocale == lang) {
      return;
    }
    if (lang == StringManager.enKey) {
      languageLocale = StringManager.enKey;
      saveLanguage(StringManager.enKey);
    } else {
      languageLocale = StringManager.arKey;
      saveLanguage(StringManager.arKey);
    }
    update();
  }
}
