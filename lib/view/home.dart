import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:there/controller/auth_controller.dart';
import 'package:there/controller/user_controller.dart';

import '../widgets/layout/root.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserController _userController = Get.find<UserController>();

    return Root(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Obx(() => Text(_userController.user?.email.toString() ?? "No user"))),
          Center(child: Obx(() => Text(_userController.user?.role.toString() ?? ""))),
        ],
      ),
    );
  }
}