import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/model/azkar_list_model.dart';
import 'package:my_islamy/model/azkar_model.dart';

class AzkarServices extends ChangeNotifier {
  List<AzkarModel> list = [];
  // var isLoading = false.obs;

  Future<List<AzkarModel>> getAzkar() async {
    var response = await http.get(Uri.parse(StringManager.azkarList));

    if (response.statusCode == 200) {
      // isLoading(true);
      final jsonData = jsonDecode(response.body)["العربية"];
      List<AzkarModel> azkarList = [];
      // Map <String,dynamic> item
      for (var item in jsonData) {
        azkarList.add(AzkarModel.fromJson(item));
      }
      print("Hello World");
      list.addAll(azkarList);
      return list;

      // return azkarList;
    } else {
      //  isLoading(false);
      return throw Exception("Error has occurred, please try again later");
    }
  }

  /* Future<List<AzkarDetailsModel>> getAzkarDetails(int number) async {
    var response =
        await http.get(Uri.parse("${StringManager.azkarUrl}$number.json"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(
          response.body)["Words of remembrance for morning and evening"];
      List<AzkarDetailsModel> azkarDetails = [];
      // Map <String,dynamic> item
      for (var item in jsonData) {
        azkarDetails.add(AzkarDetailsModel.fromJson(item));
      }
      return azkarDetails;
      /* surah.clear();
      surah.addAll(surahDetails);
      return surah;*/
    } else {
      return throw Exception("Error has occurred, please try again later");
    }
  }*/
}
