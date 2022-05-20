import 'package:get/get.dart';
import '../../services/network/quran_service.dart';

class QuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(QuranService());
  }
}
