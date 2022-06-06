import 'package:get/get.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/language/arabic.dart';
import 'package:my_islamy/language/english.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        StringManager.enKey: english,
        StringManager.arKey: arabic,
      };
}
