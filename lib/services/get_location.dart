import 'package:geolocator/geolocator.dart';

class GetLocation {
  double? Latitude;
  double? Longitude;

  Future<void> getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    Latitude = position.latitude;
    Longitude = position.longitude;
  }
}
