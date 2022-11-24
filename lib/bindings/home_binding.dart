import 'package:chopper/chopper.dart' hide Get;
import 'package:get/get.dart';
import 'package:there/controller/location_controller.dart';
import 'package:there/controller/user_controller.dart';
import 'package:there/services/location.dart';

import '../services/authentication.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController(
      service: Get.find<ChopperClient>().getService<AuthenticationService>(),
    ));

    Get.put(LocationController(
      service: Get.find<ChopperClient>().getService<LocationService>(),
    ));
  }
}