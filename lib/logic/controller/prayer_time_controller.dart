import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class PrayerController with ChangeNotifier {
  // Get User Location
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  // Get Prayers Time
  Future<PrayerTimes> prayerTime() async {
    Position position = await _determinePosition();
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');

    final myCoordinates = Coordinates(position.latitude, position.longitude);
    final params = CalculationMethod.muslim_world_league.getParameters();
    final date = DateComponents.from(DateTime.now());
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    return prayerTimes;
  }

  Future<DateTime> prayers() async {
    PrayerTimes prayers = await prayerTime();
    return prayers.fajr;
  }
}
