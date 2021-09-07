import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import './modules/login/login.dart';
import './modules/sign_up/sign_up.dart';
import './modules/splash/factories/factory.dart';
import './modules/ui/factories/factories.dart';
import '../core/core.dart';
import '../core/ports/input/remote_fetch_current_user_input_port.dart';
import '../core/service_locator/service_locator_config.dart';
import '../modules/dashboard/ui/dashboard_page.dart';

void main() async {
  await AppInitializer.init();

  runApp(MyApp(
    fetchCurrentUserInputPort: ServiceLocatorConfig.provide(),
  ));
}

class MyApp extends StatelessWidget {
  final RemoteFetchCurrentUserInputPort fetchCurrentUserInputPort;
  const MyApp({
    required this.fetchCurrentUserInputPort,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          FutureProvider<User?>.value(
            initialData: null,
            value: this.fetchCurrentUserInputPort.fetchCurrentUser(),
          ),
        ],
        child: GetMaterialApp(
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
            ),
            GetPage(
              name: '/dashboard',
              page: () => DashboardPage(),
              transition: Transition.leftToRight,
            )
          ],
        ));
  }
}
