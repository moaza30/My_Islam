import 'package:get/get.dart';
import 'package:my_islamy/model/surah_name_model.dart';
import '../../model/surah_details_model.dart';
import '../../services/network/quran_service.dart';

class SurahController extends GetxController {
//  var quran = <QuranModel>[].obs;
  var surah = <SurahDetailsModel>[].obs;
  var isLoading = false.obs;
  // var quranLoading = false.obs;
  // method to get all surah names in quran
  /* void getQuran() async {
    try {
      quranLoading(true);
      quran.value = await QuranService().getQuran();
    } finally {
      quranLoading(false);
    }
  }*/
  // get surah details

  void getSurah(int number) async {
    try {
      isLoading(true);
      surah.value = await QuranService().getSurah(number);
    } finally {
      isLoading(false);
    }
  }
}
