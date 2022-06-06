import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/logic/controller/quran_controller.dart';
import '../widget/quran_widget/surah_card.dart';
import 'package:audioplayers/audioplayers.dart';

class SurahScreen extends StatefulWidget {
  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final surahController = Get.find<SurahController>();
  late String surahName;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    surahName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Container(
          width: double.infinity,
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.23),
          child: Text(
            surahName,
            style: TextStyle(
                color:
                    Get.isDarkMode ? ColorsManager.whiteColor : Colors.black),
          ),
        ),
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
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
