import 'package:chopper/chopper.dart' hide Get;
import 'package:get/get.dart';
import 'package:there/controller/user_controller.dart';

import '../services/authentication.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController(
      service: Get.find<ChopperClient>().getService<AuthenticationService>(),
    ));
  }
}