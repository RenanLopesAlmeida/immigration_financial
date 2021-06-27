import 'package:flutter/material.dart';
import 'package:immigration_financial/modules/sign_up/factories/sign_up_presenter_factory.dart';
import 'package:immigration_financial/modules/sign_up/ui/sign_up_page.dart';

import 'factories.dart';

Widget makeSignUpPage() {
  final presenter = makeGetxSignUpPresenter();
  return SignUpPage(presenter);
}
