import 'package:flutter/material.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/logic/controller/main_controller.dart';
import 'package:my_islamy/routes/routes.dart';
import '../../consts/color_manager.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode
                ? ColorsManager.darkGreyClr
                : ColorsManager.mainColor,
            elevation: 0,
            title: Text(controller.title[controller.currentIndex.value].tr),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.settingScreen);
                },
                icon: const Icon(
                  Icons.settings,
                ),
              ),
            ],
          ),

          // Change Screens using GetX
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.screens,
          ),
          // Bottom NavBar
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.currentIndex.value = index;
            },
            selectedItemColor: ColorsManager.mainColor,
            unselectedItemColor: Get.isDarkMode
                ? ColorsManager.whiteColor
                : ColorsManager.blackColor,
            iconSize: 28,
            selectedFontSize: 13,
            items: [
              BottomNavigationBarItem(
                label: StringManager.quran.tr,
                icon: const ImageIcon(
                  AssetImage("assets/icons/reading.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: StringManager.prayerTime.tr,
                icon: const ImageIcon(
                  AssetImage(
                    "assets/icons/time.png",
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: StringManager.qubla.tr,
                icon: const ImageIcon(
                  AssetImage("assets/icons/kaaba.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: StringManager.azkar.tr,
                icon: const Icon(
                  Icons.wb_sunny_outlined,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
