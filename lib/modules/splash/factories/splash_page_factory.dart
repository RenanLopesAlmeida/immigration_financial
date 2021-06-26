import 'package:immigration_financial/core/service_locator/service_locator.dart';
import 'package:immigration_financial/modules/splash/ui/splash_page.dart';

SplashPage makeSplashPage() {
  return SplashPage(presenter: ServiceLocatorConfig.provide());
}
