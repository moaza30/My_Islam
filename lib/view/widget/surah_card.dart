import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/view/widget/text_utils.dart';
import '../../consts/color_manager.dart';
import '../../logic/controller/quran_controller.dart';

class SurahCard extends StatefulWidget {
  final int index;
  const SurahCard({Key? key, required this.index}) : super(key: key);

  @override
  State<SurahCard> createState() => _SurahCardState();
}

class _SurahCardState extends State<SurahCard> {
  final surahController = Get.put(SurahController());

  bool isVisible = false;
  bool isPlaying = false;
  AudioPlayer player = AudioPlayer();

  void playSound() async {
    isPlaying = true;
    await player.play(surahController.surah[widget.index].audioUrl!);
    setState(() {});
  }

  void stopSound() async {
    isPlaying = false;
    await player.stop();
    setState(() {});
  }

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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Show ayah and ayahNumber
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "(${ArabicNumbers().convert(surahController.surah[widget.index].number!)}) ${surahController.surah[widget.index].text!}",
                        style:
                            const TextStyle(fontSize: 18, fontFamily: "Quran"),
                      ),
                    ),
                  ),
                  isPlaying
                      ? IconButton(
                          onPressed: () {
                            stopSound();
                          },
                          icon: const Icon(
                            Icons.pause,
                            color: ColorsManager.mainColor,
                            size: 30,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            playSound();
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            color: ColorsManager.mainColor,
                            size: 30,
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
                  title: "Sssss",
                  fontSize: 15,
                  textColor: ColorsManager.whiteColor,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
