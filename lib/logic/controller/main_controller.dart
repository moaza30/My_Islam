import 'package:get/get.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/view/widget/prayer_time/prayer_time_screen.dart';
import 'package:my_islamy/view/widget/qubla/qubla_screen.dart';
import 'package:my_islamy/view/widget/quran_widget/quran_screen.dart';
import '../../view/widget/azkar_widget/azkar_screen.dart';

class MainController extends GetxController {
  // use obs cuz currentIndex value will change constantly
  RxInt currentIndex = 0.obs;
  final screens = [
    QuranScreen(),
    TimeScreen(),
    QublaScreen(),
    AzkarScreen(),
  ].obs;

  final title = [
    StringManager.quran,
    StringManager.prayerTime,
    StringManager.qubla,
    StringManager.azkar,
  ].obs;
}
