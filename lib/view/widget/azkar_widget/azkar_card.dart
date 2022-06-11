import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/logic/controller/azkar_controller.dart';
import 'package:my_islamy/model/azkar_list_model.dart';
import 'package:my_islamy/services/network/azkar_services.dart';
import '../text_utils.dart';

class AzkarCard extends StatefulWidget {
  final AzkarModel azkar;
  const AzkarCard({Key? key, required this.azkar}) : super(key: key);
  @override
  State<AzkarCard> createState() => _AzkarCardState();
}

class _AzkarCardState extends State<AzkarCard> {
  // final controller = Get.find<AzkarController>();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: ColorsManager.greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          isVisible = !isVisible;
          setState(() {});
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        widget.azkar.title!,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: const BoxDecoration(
                  color: ColorsManager.mainColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                ),
                child: TextUtlis(
                  title: "English title",
                  fontSize: 15,
                  textColor: ColorsManager.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
