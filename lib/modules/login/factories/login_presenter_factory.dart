import 'package:immigration_financial/core/service_locator/service_locator.dart';
import 'package:immigration_financial/modules/login/presentation/presenters/presenters.dart';

import 'factories.dart';

GetxLoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
    validation: makeLoginValidation(),
    remoteAuthenticateInputPort: ServiceLocatorConfig.provide(),
    localSaveCurrentAccount: ServiceLocatorConfig.provide(),
  );
}
