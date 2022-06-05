import 'package:get/get.dart';
import '../../model/surah_details_model.dart';
import '../../services/network/quran_service.dart';

class SurahController extends GetxController {
  var surah = <SurahDetailsModel>[].obs;
  var isLoading = false.obs;
  void getSurah(int number) async {
    try {
      isLoading(true);
      surah.value = await QuranService().getSurah(number);
    } finally {
      isLoading(false);
    }
  }
}
