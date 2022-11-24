import 'package:get/state_manager.dart';
import 'package:there/services/location.dart';

class LocationController extends GetxController {
  final LocationService service;

  LocationController({
    required this.service,
  });

  void saveLocation(lat, long) async {
    await service.save({
      "lat": lat,
      "long": long,
    });
  }
}