import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/initializer/initializer.dart';
import './modules/ui/ui.dart';
import './modules/login/login.dart';
import './modules/sign_up/sign_up.dart';
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
        ),
        GetPage(
          name: '/login',
          page: () => makeLoginPage(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/signUp',
          page: () => makeSignUpPage(),
          transition: Transition.rightToLeft,
          //transitionDuration: Duration(seconds: 1),
        ),
      ],
    );
  }
}
