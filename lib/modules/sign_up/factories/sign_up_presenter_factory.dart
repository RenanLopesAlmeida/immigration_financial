import 'package:immigration_financial/core/service_locator/service_locator.dart';
import 'package:immigration_financial/modules/sign_up/presentation/presenters/presenters.dart';

import 'factories.dart';

GetxSignUpPresenter makeGetxSignUpPresenter() {
  return GetxSignUpPresenter(
    validation: makeSignUpValidation(),
    signUpInputPort: ServiceLocatorConfig.provide(),
    localSaveCurrentAccount: ServiceLocatorConfig.provide(),
  );
}
