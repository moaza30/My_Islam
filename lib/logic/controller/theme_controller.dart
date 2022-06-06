import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = "isDarkMode";

  saveThemeDataInBox(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getThemeDataFromBox() {
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet =>
      getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark;

  void changeTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light);

    saveThemeDataInBox(!getThemeDataFromBox());
  }
}
