import 'package:geolocator/geolocator.dart';

import '../../Widgets/Widgets.dart';

/// location_service.dart
class LocationService {
  LocationService._();

  /// get current location
  static Future<Position?> getCurrentLocation({bool showError = true}) async {
    // bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (showError) {
          Widgets.showToast('Location permissions are denied', error: true);
        }
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // return Future.error(
      //   'Location permissions are permanently denied, we cannot request permissions.',
      // );
      if (showError) {
        Widgets.showToast('Location permissions are permanently denied, we cannot request permissions.', error: true);
      }
      
      return null;
    }

    return Geolocator.getCurrentPosition();
  }
}
