import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/view/screens/surah_screen.dart';
import 'package:my_islamy/view/widget/text_utils.dart';

class CustomContainer extends StatelessWidget {
  String arText;
  String enText;
  int surahNumber = 0;
  int index;
  double width;
  Function() onTap;
  TextDirection textDirection;

  CustomContainer({
    required this.arText,
    required this.enText,
    required this.surahNumber,
    required this.index,
    required this.width,
    required this.textDirection,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100, //MediaQuery.of(context).size.height * 0.1,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? ColorsManager.dark : ColorsManager.greyColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: TextUtlis(
                  title: enText,
                  fontSize: 22,
                  textColor: Get.isDarkMode
                      ? ColorsManager.whiteColor
                      : ColorsManager.blackColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtlis(
                    title: ArabicNumbers().convert(surahNumber),
                    fontSize: 20,
                    textColor: Get.isDarkMode
                        ? ColorsManager.whiteColor
                        : ColorsManager.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: Directionality(
                  textDirection: textDirection,
                  child: TextUtlis(
                    title: arText,
                    fontSize: 22,
                    textColor: Get.isDarkMode
                        ? ColorsManager.whiteColor
                        : ColorsManager.blackColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
