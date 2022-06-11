import 'package:get/get.dart';
import 'package:my_islamy/model/azkar_list_model.dart';
import 'package:my_islamy/model/azkar_model.dart';
import 'package:my_islamy/services/network/azkar_services.dart';

class AzkarController extends GetxController {
  var azkar = <AzkarDetailsModel>[].obs;
  var isLoading = false.obs;

  /* void getAzkar() async {
    try {
      isLoading(true);
      azkar.value = await AzkarServices().getAzkar();
    } finally {
      isLoading(false);
    }
  }*/

  /*void getAzkarDetails(int number) async {
    try {
      isLoading(true);
      azkar.value = await AzkarServices().getAzkarDetails(number);
    } finally {
      isLoading(false);
    }
  }*/
}
