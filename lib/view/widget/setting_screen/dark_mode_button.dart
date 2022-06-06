import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/logic/controller/main_controller.dart';
import 'package:my_islamy/view/widget/text_utils.dart';

class darkModeWidget extends StatelessWidget {
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
            activeTrackColor: ColorsManager.mainColor,
            activeColor: ColorsManager.mainColor,
            value: controller.switchValue.value,
            onChanged: (value) {
              controller.switchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text("Dark Mode"),
        ],
      ),
    );
  }
}
