import 'package:flutter/material.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Immigration Financial',
      theme: makeAppTheme(),
      home: makeLoginPage(),
    );
  }
}
