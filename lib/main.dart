import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immigration_financial/modules/splash/ui/splash_page.dart';

import '../core/initializer/initializer.dart';
import './modules/ui/ui.dart';
import './modules/login/login.dart';

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
        GetPage(name: '/', page: () => SplashPage()),
        GetPage(name: '/login', page: () => makeLoginPage()),
      ],
    );
  }
}
