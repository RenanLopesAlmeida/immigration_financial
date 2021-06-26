import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/initializer/initializer.dart';
import './modules/ui/ui.dart';
import './modules/login/login.dart';
import './modules/splash/factories/factory.dart';

void main() async {
  await AppInitializer.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Immigration Financial',
      theme: makeAppTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => makeSplashPage(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(seconds: 3),
        ),
        GetPage(
          name: '/login',
          page: () => makeLoginPage(),
          transition: Transition.rightToLeft,
          transitionDuration: Duration(seconds: 1),
        ),
      ],
    );
  }
}
