import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './modules/ui/ui.dart';
import './modules/login/login.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

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
