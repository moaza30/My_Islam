import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/logic/controller/quran_controller.dart';
import 'package:my_islamy/logic/controller/settings_controller.dart';
import 'package:my_islamy/services/network/quran_service.dart';
import 'package:my_islamy/view/widget/text_utils.dart';
import '../../../routes/routes.dart';
import 'cutom_container.dart';

class QuranScreen extends StatefulWidget {
  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  final controller = Get.put(QuranService());
  final surahController = Get.find<SurahController>();
  final langController = Get.find<SettingsController>();
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        surahController.getSurah(index + 1);
                        Get.toNamed(Routes.surahScreen,
                            arguments: controller.list[index].name!);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        margin: const EdgeInsets.all(10),
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
                              Expanded(
                                flex: 1,
                                child: TextUtlis(
                                  title: langController.languageLocale ==
                                          StringManager.arKey
                                      ? controller.list[index].name!
                                      : controller.list[index].englishName!,
                                  fontSize: 18,
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
                                    title: StringManager.ayatNumber.tr,
                                    fontSize: 17,
                                    textColor: Get.isDarkMode
                                        ? ColorsManager.whiteColor
                                        : ColorsManager.blackColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  SizedBox(
                                      height: langController.languageLocale ==
                                              StringManager.arKey
                                          ? 0
                                          : 10),
                                  TextUtlis(
                                    title: langController.languageLocale ==
                                            StringManager.arKey
                                        ? ArabicNumbers().convert(controller
                                            .list[index].numberOfAyahs!)
                                        : "${controller.list[index].numberOfAyahs!}",
                                    fontSize: langController.languageLocale ==
                                            StringManager.arKey
                                        ? 18
                                        : 15,
                                    textColor: Get.isDarkMode
                                        ? ColorsManager.whiteColor
                                        : ColorsManager.blackColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Expanded(
                                flex: 1,
                                child: Directionality(
                                  textDirection:
                                      langController.languageLocale ==
                                              StringManager.arKey
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                  child: TextUtlis(
                                    title: langController.languageLocale ==
                                            StringManager.arKey
                                        ? controller.list[index].englishName!
                                        : controller.list[index].name!,
                                    fontSize: 20,
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
                  itemCount: controller.list.length,
                ),

                // ListView for Juz details
                ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomContainer(
                      index: index,
                      arText:
                          langController.languageLocale == StringManager.arKey
                              ? "Juz"
                              : "الجزء",
                      enText:
                          langController.languageLocale == StringManager.arKey
                              ? "الجزء"
                              : "Juz",
                      width: 50,
                      surahNumber: index + 1,
                      textDirection:
                          langController.languageLocale == StringManager.arKey
                              ? TextDirection.ltr
                              : TextDirection.rtl,
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
    });
  }
}
