import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/logic/controller/settings_controller.dart';
import '../text_utils.dart';

class languageWidget extends StatelessWidget {
  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.languageSetting,
                  ),
                  child: const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                TextUtlis(
                  title: StringManager.language.tr,
                  fontSize: 20,
                  textColor: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color:
                      Get.isDarkMode ? ColorsManager.mainColor : Colors.black,
                  width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.languageLocale,
                onChanged: (value) {
                  controller.changeLanguage(value!);
                  Get.updateLocale(Locale(value));
                },
                iconSize: 25,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color:
                      Get.isDarkMode ? ColorsManager.mainColor : Colors.black,
                ),
                items: const [
                  DropdownMenuItem(
                    value: StringManager.enKey,
                    child: Text(
                      StringManager.enFlag,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: StringManager.arKey,
                    child: Text(
                      StringManager.arFlag,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
