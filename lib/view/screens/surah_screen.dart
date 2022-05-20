import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/view/widget/text_utils.dart';
import '../../services/network/quran_service.dart';
import '../widget/custom_card.dart';
import 'package:quran/quran.dart' as quran;

class SurahScreen extends StatefulWidget {
  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final controller = Get.put(QuranService());
  late int surahNumber;
  @override
  Widget build(BuildContext context) {
    surahNumber = ModalRoute.of(context)!.settings.arguments as int;
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
      body: Directionality(
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
                  letterSpacing: 0.0),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: quran.getVerseCount(surahNumber),
                itemBuilder: (context, index) {
                  return customCard(index: index + 1, surahNumber: surahNumber);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customCard({
  required int index,
  required int surahNumber,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    decoration: BoxDecoration(
      color: ColorsManager.greyColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: InkWell(
      onTap: () {},
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextUtlis(
                      title:
                          "${ArabicNumbers().convert(index)}- ${quran.getVerse(surahNumber, index)}",
                      fontSize: 18,
                      textColor: ColorsManager.blackColor,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    AudioPlayer player = AudioPlayer();
                    player.play("audioUrl");
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                    color: ColorsManager.mainColor,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: false,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: const BoxDecoration(
                color: ColorsManager.mainColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
              ),
              child: TextUtlis(
                title: "Sssss",
                fontSize: 15,
                textColor: ColorsManager.whiteColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
