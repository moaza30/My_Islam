import 'package:flutter/material.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/view/widget/setting_screen/dark_mode_button.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.mainColor,
        elevation: 0,
        title: Text(StringManager.settings),
        centerTitle: true,
      ),
      body: Column(
        children: [
          darkModeWidget(),
        ],
      ),
    );
  }
}
