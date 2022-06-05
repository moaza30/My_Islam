import 'package:get/get.dart';
import 'package:my_islamy/logic/controller/quran_controller.dart';
import '../../services/network/quran_service.dart';

class QuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(QuranService());
    Get.put(SurahController());
  }
}
