import 'package:geolocator/geolocator.dart';

class Location {
  Future<Position?> getPosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (serviceEnabled) {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            return null;
          } else {
            Position _position = await Geolocator.getCurrentPosition();
            return _position;
          }
        } else {
          Position _position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          return _position;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
