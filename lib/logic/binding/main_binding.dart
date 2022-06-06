import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:my_islamy/logic/controller/main_controller.dart';
import 'package:my_islamy/logic/controller/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
  }
}
