import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/logic/controller/quran_controller.dart';
import 'package:my_islamy/view/widget/text_utils.dart';
import 'package:quran/quran.dart' as quran;
import '../widget/surah_card.dart';

class SurahScreen extends StatefulWidget {
  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final surahController = Get.find<SurahController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.whiteColor,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: ColorsManager.mainColor,
        ),
      ),
      body: Obx(
        () {
          if (surahController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: ColorsManager.mainColor),
            );
          } else {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextUtlis(
                      title: quran.basmala,
                      fontSize: 20,
                      textColor: ColorsManager.blackColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.0,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: surahController.surah.length,
                      /*controller.surah.length,*/
                      itemBuilder: (context, index) {
                        return SurahCard(
                          index: index,
                        );
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: const BoxDecoration(
                      color: ColorsManager.mainColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(child: Text("ssss")),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
