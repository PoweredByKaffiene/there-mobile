import 'package:chopper/chopper.dart' hide Get;
import 'package:get/get.dart';
import 'package:there/constants.dart';
import 'package:there/controller/user_controller.dart';
import 'package:there/model/login_result.dart';
import 'package:there/services/authentication.dart';

import '../controller/auth_controller.dart';
import '../model/user.dart';
import '../net/interceptors.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChopperClient(
      baseUrl: apiBaseURL,
      converter: JsonToTypeConverter({
        LoginResult: (jsonData) => LoginResult.fromJson(jsonData),
        User: (jsonData) => User.fromJson(jsonData),
      }),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(whitelist: [
          '/authentication/login'
        ])
      ],
      services: [
        AuthenticationService.create()
      ]
    ));

    Get.put(AuthenticationController(
      authService: Get.find<ChopperClient>().getService<AuthenticationService>(),
    ));
  }
}
