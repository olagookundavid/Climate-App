// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';

class Location {
 double? latitude;
 double? longitude;

  Future<void> getpermission() async {
    await Geolocator.requestPermission();
  }

  Future<void> getuserLocation() async {
    getpermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
