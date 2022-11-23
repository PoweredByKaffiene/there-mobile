import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ripple/flutter_ripple.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:there/controller/auth_controller.dart';

import 'package:there/controller/user_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/layout/root.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  UserController _userController = Get.find<UserController>();
  AuthenticationController _authController = Get.find<AuthenticationController>();

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
          // Row(children: [
          //   Text("Hello, ",
          //       style: theme.textTheme.headline2?.copyWith(
          //           color: theme.primaryColor, fontWeight: FontWeight.bold),
          //       textAlign: TextAlign.start),
          //   Obx(() => Text(_userController.user?.username ?? '',
          //       style: theme.textTheme.headline2?.copyWith(
          //           color: theme.primaryColor, fontWeight: FontWeight.bold),
          //       textAlign: TextAlign.start)),
          // ]),
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
                  recognizer: TapGestureRecognizer()..onTap = () {
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
