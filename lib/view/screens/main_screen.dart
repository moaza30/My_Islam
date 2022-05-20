import 'package:flutter/material.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/logic/controller/main_controller.dart';
import '../../consts/color_manager.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsManager.mainColor,
            elevation: 0,
            title: Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,
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
            unselectedItemColor: ColorsManager.blackColor,
            iconSize: 28,
            selectedFontSize: 13,
            items: const [
              BottomNavigationBarItem(
                label: StringManager.quran,
                icon: ImageIcon(
                  AssetImage("assets/icons/reading.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: StringManager.prayerTime,
                icon: ImageIcon(
                  AssetImage("assets/icons/time.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: StringManager.qubla,
                icon: ImageIcon(
                  AssetImage("assets/icons/kaaba.png"),
                ),
              ),
              BottomNavigationBarItem(
                  label: StringManager.settings,
                  icon: Icon(
                    Icons.settings,
                  )),
            ],
          ),
        );
      },
    );
  }
}
