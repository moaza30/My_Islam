import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/logic/controller/azkar_controller.dart';
import 'package:my_islamy/view/widget/azkar_widget/azkar_card.dart';

class AzkarDetails extends StatelessWidget {
  late String azkarType;
  final controller = Get.find<AzkarController>();
  @override
  Widget build(BuildContext context) {
    azkarType = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.whiteColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          azkarType,
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: ColorsManager.mainColor,
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: ColorsManager.mainColor),
            );
          } else {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.azkar.length,
                      /*controller.surah.length,*/
                      itemBuilder: (context, index) {
                        return AzkarCard(index: index);
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
