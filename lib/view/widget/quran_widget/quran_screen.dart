import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/logic/controller/settings_controller.dart';
import 'package:my_islamy/model/quran_data.dart';
import 'package:my_islamy/view/widget/text_utils.dart';
import '../../../routes/routes.dart';
import 'cutom_container.dart';
import 'package:quran/quran.dart' as quran;

class QuranScreen extends StatefulWidget {
  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  final langController = Get.find<SettingsController>();
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: ColorsManager.mainColor,
          controller: tabController,
          tabs: [
            Tab(
              child: Text(
                StringManager.surah.tr,
                style: const TextStyle(color: ColorsManager.mainColor),
              ),
            ),
            Tab(
              child: Text(
                StringManager.juz.tr,
                style: const TextStyle(color: ColorsManager.mainColor),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              // Surah Name
              ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.surahScreen, arguments: index);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? ColorsManager.dark
                            : ColorsManager.greyColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Directionality(
                              textDirection: langController.languageLocale ==
                                      StringManager.arKey
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              child: TextUtlis(
                                title: QuranData.quranNames[index],
                                /* langController.languageLocale ==
                                        StringManager.arKey
                                    ? quran.getSurahNameArabic(index + 1)
                                    : quran.getSurahName(index + 1),*/
                                fontSize: 20,
                                textColor: Get.isDarkMode
                                    ? ColorsManager.whiteColor
                                    : ColorsManager.blackColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            quran.getPlaceOfRevelation(index + 1) == "Makkah"
                                ? SvgPicture.asset("assets/images/makkah.svg")
                                : SvgPicture.asset("assets/images/madinah.svg"),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextUtlis(
                                  title: StringManager.ayatNumber.tr,
                                  fontSize: 13,
                                  textColor: Get.isDarkMode
                                      ? ColorsManager.whiteColor
                                      : ColorsManager.blackColor,
                                  fontWeight: FontWeight.normal,
                                ),
                                TextUtlis(
                                  title: QuranData.ayatNumbers[index],
                                  /* langController.languageLocale ==
                                          StringManager.arKey
                                      ? ArabicNumbers()
                                          .convert(QuranData.ayatNumbers[index])
                                      : QuranData.ayatNumbers[index],*/
                                  fontSize: 16,
                                  textColor: Get.isDarkMode
                                      ? ColorsManager.whiteColor
                                      : ColorsManager.blackColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: ColorsManager.mainColor,
                      thickness: 1,
                    ),
                  );
                },
                itemCount: 114,
              ),

              // ListView for Juz details
              ListView.separated(
                itemBuilder: (context, index) {
                  return CustomContainer(
                    index: index,
                    arText: langController.languageLocale == StringManager.arKey
                        ? "Juz"
                        : "??????????",
                    enText: langController.languageLocale == StringManager.arKey
                        ? "??????????"
                        : "Juz",
                    width: 50,
                    surahNumber: index + 1,
                    textDirection:
                        langController.languageLocale == StringManager.arKey
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                    onTap: () {
                      Get.toNamed(Routes.juzScreen, arguments: index);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: ColorsManager.mainColor,
                      thickness: 1,
                    ),
                  );
                },
                itemCount: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
