import 'package:get/get.dart';
import 'package:my_islamy/logic/controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
