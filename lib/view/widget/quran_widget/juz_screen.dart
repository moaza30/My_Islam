import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/consts/string_manager.dart';
import 'package:my_islamy/model/quran_data.dart';
import 'package:quran/quran.dart' as quran;

class JuzScreen extends StatefulWidget {
  @override
  State<JuzScreen> createState() => _JuzScreenState();
}

class _JuzScreenState extends State<JuzScreen> {
  late int index;
  String? juz;

  void loadSora(int index) async {
    juz = await QuranData.readJuz(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    index = ModalRoute.of(context)!.settings.arguments as int;
    if (juz == null) {
      loadSora(index);
    }
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Text("Juz"),
        iconTheme: const IconThemeData(
          color: ColorsManager.mainColor,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: (juz == null)
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : Text(
                        juz!,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Get.isDarkMode
                              ? ColorsManager.whiteColor
                              : ColorsManager.blackColor,
                          fontSize: 24,
                          height: 2,
                          fontFamily: "Quran",
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
