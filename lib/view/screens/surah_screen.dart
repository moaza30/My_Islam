import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/logic/controller/quran_controller.dart';
import 'package:my_islamy/logic/controller/settings_controller.dart';
import 'package:my_islamy/model/quran_data.dart';
import '../widget/quran_widget/surah_card.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quran/quran.dart' as quran;

class SurahScreen extends StatefulWidget {
  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final langController = Get.find<SettingsController>();
  late int number;

  @override
  Widget build(BuildContext context) {
    number = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          langController.languageLocale == StringManager.arKey
              ? quran.getSurahNameArabic(number + 1)
              : quran.getSurahName(number + 1),
          style: TextStyle(
              color: Get.isDarkMode ? ColorsManager.whiteColor : Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: ColorsManager.mainColor,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: quran.getVerseCount(number + 1),
                itemBuilder: (context, index) {
                  return SurahCard(
                    surahNumber: number + 1,
                    ayah: index + 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
