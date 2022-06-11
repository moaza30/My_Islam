import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_islamy/logic/controller/prayer_time_controller.dart';
import 'package:provider/provider.dart';

class TimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<DateTime>(
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
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get Location"),
                ),
                Text(DateFormat.jm().format(snapshot.data!)),
              ],
            );
          }
        },
      ),
    );
  }
}
