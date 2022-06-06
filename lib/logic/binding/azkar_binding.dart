import 'package:get/get.dart';
import 'package:my_islamy/logic/controller/azkar_controller.dart';

class AzkarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AzkarController());
  }
}
