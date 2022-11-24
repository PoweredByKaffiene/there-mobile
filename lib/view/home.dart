import 'dart:isolate';
import 'dart:ui';

import 'package:background_location/background_location.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ripple/flutter_ripple.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:there/constants.dart';
import 'package:there/controller/auth_controller.dart';

import 'package:there/controller/user_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_socket_channel/io.dart';

import '../widgets/layout/root.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserController _userController = Get.find<UserController>();

  AuthenticationController _authController =
      Get.find<AuthenticationController>();

  RxBool isRunning = false.obs;

  void onLocationUpdate(location) {
    print(location.toMap().toString());
  }

  @override
  void initState() {
    super.initState();

    initWebsocketConnection();
    initBackgroundTask();
  }

  void initWebsocketConnection() {
    var ws = IOWebSocketChannel.connect(Uri.parse("ws://echo.websocket.events"));

    ws.stream.listen((message) {
      print("new ws message: $message");
    });
  }

  Future initBackgroundTask() async {
    await BackgroundLocation.setAndroidNotification(
      title: "There Background Service",
            message: "Sharing Location in the background",
            icon: "@mipmap/ic_launcher",
    );

    await BackgroundLocation.setAndroidConfiguration(2500);
    await BackgroundLocation.startLocationService();

    BackgroundLocation.getLocationUpdates(onLocationUpdate);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    return Root(
      appbar: AppBar(
        centerTitle: true,
        title: const Text('Sharing live Location'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _authController.logout();
              Get.offAllNamed('/login');
            },
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.h),
          Expanded(
            child: FlutterRipple(
              radius: 40.w,
              rippleColor: colorScheme.secondary,
              child: Icon(Icons.local_shipping,
                  size: 18.w, color: colorScheme.onSecondary),
            ),
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text:
                      "You may close the app now, It will keep on running in the background. ",
                  style: theme.textTheme.subtitle1),
              TextSpan(
                  text: "Learn more",
                  style: theme.textTheme.subtitle1?.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse("https://dontkillmyapp.com/"));
                    }),
            ]),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h)
        ],
      ),
    );
  }
}
