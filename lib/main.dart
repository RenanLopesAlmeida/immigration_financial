import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immigration_financial/core/ports/input/remote_fetch_current_user_input_port.dart';
import 'package:immigration_financial/core/service_locator/service_locator_config.dart';
import 'package:immigration_financial/modules/dashboard/ui/dashboard_page.dart';
import 'package:provider/provider.dart';

import '../core/core.dart';
import './modules/ui/ui.dart';
import './modules/login/login.dart';
import './modules/sign_up/sign_up.dart';
import './modules/splash/factories/factory.dart';

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
              //transitionDuration: Duration(seconds: 1),
            ),
            GetPage(
              name: '/dashboard',
              page: () => DashboardPage(),
              transition: Transition.zoom,
            )
          ],
        ));
  }
}
