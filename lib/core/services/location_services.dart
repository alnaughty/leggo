import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  // Request location permission
  Future<void> requestPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      status = await Permission.location.request();
      if (!status.isGranted) {
        throw Exception('Location permission denied.');
      }
    }

    if (status.isPermanentlyDenied) {
      throw Exception(
        'Location permission permanently denied. Please enable it in settings.',
      );
    }
  }

  // Check if location service is enabled
  Future<void> checkServiceEnabled() async {
    final serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }
  }

  // Get current location safely
  Future<Position> getCurrentLocation() async {
    await requestPermission();
    await checkServiceEnabled();

    return await _geolocatorPlatform.getCurrentPosition(
      locationSettings: AndroidSettings(accuracy: LocationAccuracy.high),
    );
  }

  // Stream location updates safely
  Stream<Position> getLocationStream({
    LocationAccuracy accuracy = LocationAccuracy.high,
    int distanceFilter = 2,
  }) async* {
    await requestPermission();
    await checkServiceEnabled();

    yield* _geolocatorPlatform.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: accuracy,
        distanceFilter: distanceFilter,
      ),
    );
  }
}
