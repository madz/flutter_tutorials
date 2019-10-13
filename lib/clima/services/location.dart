import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Future<Position> getCurrentLocation() async {
    Position position;
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      debugPrint(e.toString());
    }

    debugPrint('getLocation = ${position.toString()}');

    return position;
  }
}
