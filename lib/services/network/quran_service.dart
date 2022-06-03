import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/model/surah_details_model.dart';
import 'package:my_islamy/model/surah_name_model.dart';

class QuranService extends GetxController {
  var list = <QuranModel>[].obs;
  var surah = <SurahDetailsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getQuran();
    getSurah();
  }

  Future<List<QuranModel>> getQuran() async {
    var response = await http.get(Uri.parse("${StringManager.baseUrl}/surah"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body)["data"];
      List<QuranModel> quranList = [];
      // Map <String,dynamic> item
      for (var item in jsonData) {
        quranList.add(QuranModel.fromJson(item));
      }
      list.addAll(quranList);
      return list;
    } else {
      return throw Exception("Error has occurred, please try again later");
    }
  }

  Future<List<SurahDetailsModel>> getSurah({int? number = 2}) async {
    var response = await http
        .get(Uri.parse("${StringManager.baseUrl}/surah/$number/ar.alafasy"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body)["data"]["ayahs"];
      List<SurahDetailsModel> surahDetails = [];
      // Map <String,dynamic> item
      for (var item in jsonData) {
        surahDetails.add(SurahDetailsModel.fromJson(item));
      }
      surah.clear();
      surah.addAll(surahDetails);
      return surah;
    } else {
      return throw Exception("Error has occurred, please try again later");
    }
  }
}
