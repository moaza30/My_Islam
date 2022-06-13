import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_islamy/logic/controller/prayer_time_controller.dart';
import 'package:provider/provider.dart';
import '../../../consts/color_manager.dart';

class TimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<DateTime>>(
        future: Provider.of<PrayerController>(context, listen: false).prayers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.data == null) {
            return const Center(
              child: Text("Error please try again later"),
            );
          } else {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ).add(const EdgeInsets.only(bottom: 70)),
              child: Column(
                children: [
                  prayer(
                    prayer: "الفجر",
                    time: DateFormat.jm().format(snapshot.data![0]),
                  ),
                  prayer(
                    prayer: "الشروق",
                    time: DateFormat.jm().format(snapshot.data![1]),
                  ),
                  prayer(
                    prayer: "الظهر",
                    time: DateFormat.jm().format(snapshot.data![2]),
                  ),
                  prayer(
                    prayer: "العصر",
                    time: DateFormat.jm().format(snapshot.data![3]),
                  ),
                  prayer(
                    prayer: "المفرب",
                    time: DateFormat.jm().format(snapshot.data![4]),
                  ),
                  prayer(
                    prayer: "العشاء",
                    time: DateFormat.jm().format(snapshot.data![5]),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget prayer({
    required String prayer,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              prayer,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "Quran",
              ),
            ),
            Text(
              time,
            ),
          ],
        ),
      ),
    );
  }
}
