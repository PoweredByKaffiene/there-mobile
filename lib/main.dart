import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:logging/logging.dart';

import 'package:there/bindings/initial_binding.dart';
import 'package:there/styles.dart';
import 'package:there/view/home.dart';
import 'package:there/view/splash.dart';

import 'bindings/home_binding.dart';
import 'view/login.dart';

void _setupLogging() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

void main() {
  if (kDebugMode) _setupLogging();
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
          initialBinding: InitialBinding(),
          getPages: [
            GetPage(name: '/splash', page: () => const SplashScreen()),
            GetPage(name: '/login', page: () => LoginScreen()),
            GetPage(name: '/home', page: () => HomeScreen(), binding: HomeBinding()),
          ],
        );
      },
    );
  }
}