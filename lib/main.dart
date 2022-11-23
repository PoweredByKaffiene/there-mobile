import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:there/styles.dart';
import 'package:there/view/home.dart';
import 'package:there/view/splash.dart';

import 'view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'There',
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode: ThemeMode.light,
          initialRoute: '/splash',
          getPages: [
            GetPage(name: '/splash', page: () => const SplashScreen()),
            GetPage(name: '/login', page: () => const LoginScreen()),
            GetPage(name: '/home', page: () => const HomeScreen()),
          ],
        );
      },
    );
  }
}