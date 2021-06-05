import 'package:flutter/material.dart';

import 'factories.dart';

import '../ui/login_page.dart';

Widget makeLoginPage() {
  final presenter = makeGetxLoginPresenter();
  return LoginPage(presenter);
}
