import 'package:injectable/injectable.dart';

import 'package:immigration_financial/modules/splash/presenters/getx_splash_presenter.dart';
import 'package:immigration_financial/modules/splash/protocols/splash_presenter.dart';

@module
abstract class SplashPresenterModule {
  @singleton
  SplashPresenter splashPresenter(GetxSplashPresenter presenter) => presenter;
}
