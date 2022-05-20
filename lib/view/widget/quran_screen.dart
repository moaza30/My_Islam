import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/model/surah_details_model.dart';
import 'package:my_islamy/services/network/quran_service.dart';
import 'package:my_islamy/view/widget/text_utils.dart';
import '../../routes/routes.dart';

class QuranScreen extends StatefulWidget {
  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  final controller = Get.put(QuranService());

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
            tabs: const [
              Tab(
                child: Text(
                  "Surah",
                  style: TextStyle(color: ColorsManager.mainColor),
                ),
              ),
              Tab(
                child: Text(
                  "Juz",
                  style: TextStyle(color: ColorsManager.mainColor),
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
                    return customContainer(
                      arText: controller.list[index].name!,
                      enText: controller.list[index].englishName!,
                      text: "عدد الأيات",
                      width: 90,
                      index: index + 1,
                      surahNumber: controller.list[index].numberOfAyahs!,
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
                ListView.separated(
                  itemBuilder: (context, index) {
                    return customContainer(
                      index: index,
                      arText: "الجزء",
                      enText: "Juz",
                      text: "",
                      width: 50,
                      surahNumber: index + 1,
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

Widget customContainer({
  required String arText,
  required String enText,
  required String text,
  int surahNumber = 0,
  required int index,
  required double width,
}) {
  return InkWell(
    onTap: () {
      QuranService().getSurah(number: index);
      Get.toNamed(Routes.surahScreen, arguments: index);
    },
    child: Container(
      height: 100, //MediaQuery.of(context).size.height * 0.1,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorsManager.greyColor,
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
                fontSize: 18,
                textColor: ColorsManager.blackColor,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtlis(
                  title: text,
                  fontSize: 18,
                  textColor: ColorsManager.blackColor,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.0,
                ),
                TextUtlis(
                  title: ArabicNumbers().convert(surahNumber),
                  fontSize: 18,
                  textColor: ColorsManager.blackColor,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.0,
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextUtlis(
                  title: arText,
                  fontSize: 17,
                  textColor: ColorsManager.blackColor,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
