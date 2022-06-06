import 'package:flutter/material.dart';
import 'package:my_islamy/consts/color_manager.dart';

class ThemesApp {
  static final light = ThemeData(
    primaryColor: ColorsManager.mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: ColorsManager.darkGreyClr,
    backgroundColor: ColorsManager.darkGreyClr,
    brightness: Brightness.dark,
  );
}
