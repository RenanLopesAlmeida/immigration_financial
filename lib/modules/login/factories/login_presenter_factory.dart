import 'factories.dart';
import '../presentation/presenters/presenters.dart';

GetxLoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
    validation: makeLoginValidation(),
  );
}
