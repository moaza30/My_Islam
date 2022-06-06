import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/view/widget/setting_screen/dark_mode_button.dart';
import 'package:my_islamy/view/widget/setting_screen/language_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        title: Text(
          StringManager.settings.tr,
          style: TextStyle(
              color: Get.isDarkMode
                  ? ColorsManager.whiteColor
                  : ColorsManager.blackColor),
        ),
        iconTheme: IconThemeData(
            color: Get.isDarkMode
                ? ColorsManager.whiteColor
                : ColorsManager.blackColor),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            darkModeWidget(),
            const SizedBox(height: 15),
            languageWidget(),
          ],
        ),
      ),
    );
  }
}
