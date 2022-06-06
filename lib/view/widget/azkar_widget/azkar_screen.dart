import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/logic/controller/azkar_controller.dart';
import 'package:my_islamy/logic/controller/settings_controller.dart';
import 'package:my_islamy/routes/routes.dart';
import 'package:my_islamy/view/widget/text_utils.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AzkarScreen extends StatefulWidget {
  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  final controller = Get.find<AzkarController>();
  // change app language
  final langController = Get.find<SettingsController>();
  bool isPlaying = false;
  final assetsAudioPlayer = AssetsAudioPlayer();
  List<Map<String, dynamic>> azkarList = [
    {
      "ID": 129,
      "TITLE": "الاستغفار و التوبة",
      "enTITLE": "Repentance and seeking forgiveness",
      "audio": "forgive.mp3"
    },
    {
      "ID": 27,
      "TITLE": "أذكار الصباح والمساء",
      "enTITLE": "Words of remembrance for morning and evening",
      "audio": "morning.mp3"
    },
    {
      "ID": 28,
      "TITLE": "أذكار النوم",
      "enTITLE": "What to say before sleeping",
      "audio": "sleep.mp3"
    },
    {
      "ID": 1,
      "TITLE": "أذكار الاستيقاظ من النوم",
      "enTITLE": "supplications for when you wake up",
      "audio": "sleep2.mp3"
    },
    {
      "ID": 17,
      "TITLE": "دعاء الركوع",
      "enTITLE": "Invocations during Ruki' (bowing in prayer)",
      "audio": "1.mp3"
    },
    {
      "ID": 12,
      "TITLE": "دعاء الذهاب إلى المسجد",
      "enTITLE": "Invocation for going to the mosque",
      "audio": "going_to_mosque.mp3"
    },
    {
      "ID": 13,
      "TITLE": "دعاء دخول المسجد",
      "enTITLE": "Invocation for entering the mosque",
      "audio": "enter_mosque.mp3"
    },
    {
      "ID": 14,
      "TITLE": "دعاء الخروج من المسجد",
      "enTITLE": "Invocation for leaving the mosque",
      "audio": "leave_mosque.mp3"
    },
    {
      "ID": 6,
      "TITLE": "دعاء دخول الخلاء",
      "enTITLE": "Invocation for entering the restroom",
      "audio": "restroom1.mp3"
    },
    {
      "ID": 7,
      "TITLE": "دعاء الخروج من الخلاء",
      "enTITLE": "Invocation for leaving the restroom",
      "audio": "leave_restroom.mp3"
    },
    {
      "ID": 96,
      "TITLE": "دعاء السفر",
      "enTITLE": "Invocation for traveling",
      "audio": "travel.mp3"
    },
    {
      "ID": 60,
      "TITLE": "دعاء زيارة القبور",
      "enTITLE": "Invocation for visiting the graves",
      "audio": "grave.mp3"
    },
  ];

  void playSound(String path) async {
    await assetsAudioPlayer.open(
      Audio("assets/sounds/$path"),
      showNotification: true,
    );
    setState(() {});
  }

  void stopSound() {
    assetsAudioPlayer.stop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller.getAzkarDetails(azkarList[index]["ID"]);
                  Get.toNamed(Routes.azkarScreen,
                      arguments: azkarList[index]["TITLE"]);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? ColorsManager.dark
                        : ColorsManager.greyColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            playSound(azkarList[index]["audio"]);
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            color: ColorsManager.mainColor,
                            size: 30,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: TextUtlis(
                              title: langController.languageLocale ==
                                      StringManager.arKey
                                  ? azkarList[index]["TITLE"]
                                  : azkarList[index]["enTITLE"],
                              fontSize: 18,
                              textColor: Get.isDarkMode
                                  ? ColorsManager.whiteColor
                                  : ColorsManager.blackColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
            itemCount: azkarList.length,
          ),
        ),
      ],
    );
  }
}
