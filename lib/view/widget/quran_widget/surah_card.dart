import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../consts/color_manager.dart';
import 'package:quran/quran.dart' as quran;

class SurahCard extends StatefulWidget {
  final int surahNumber, ayah;
  const SurahCard({Key? key, required this.surahNumber, required this.ayah})
      : super(key: key);

  @override
  State<SurahCard> createState() => _SurahCardState();
}

class _SurahCardState extends State<SurahCard> {
  Color color = Get.isDarkMode ? ColorsManager.dark : ColorsManager.greyColor;

  void changeColor() {
    color = ColorsManager.mainColor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        onLongPress: () {
          changeColor();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Show ayah and ayahNumber
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "${ArabicNumbers().convert(widget.ayah)} ${quran.getVerse(widget.surahNumber, widget.ayah)}",
                        style: const TextStyle(
                          fontSize: 23,
                          fontFamily: "Quran",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
