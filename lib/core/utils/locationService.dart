import 'package:geolocator/geolocator.dart';

/// location_service.dart
class LocationService {
  LocationService._();

  /// get current location
  static Future<Position> getCurrentLocation() async {
    // bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return Geolocator.getCurrentPosition();
  }
}
