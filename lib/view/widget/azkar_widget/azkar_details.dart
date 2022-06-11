import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/logic/controller/azkar_controller.dart';
import 'package:my_islamy/model/azkar_list_model.dart';
import 'package:my_islamy/services/network/azkar_services.dart';
import 'package:my_islamy/view/widget/azkar_widget/azkar_card.dart';
import 'package:provider/provider.dart';

class AzkarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.whiteColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "ss",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: ColorsManager.mainColor,
        ),
      ),
      body: FutureBuilder<List<AzkarModel>>(
          future: Provider.of<AzkarServices>(context, listen: false).getAzkar(),
          builder: (context, snapshot) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      /*controller.surah.length,*/
                      itemBuilder: (context, index) {
                        return AzkarCard(
                          azkar: snapshot.data![index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
