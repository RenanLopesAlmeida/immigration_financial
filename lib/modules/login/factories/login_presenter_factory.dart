import 'package:immigration_financial/modules/login/presentation/presenters/presenters.dart';

import 'factories.dart';

GetxLoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
    validation: makeLoginValidation(),
  );
}
