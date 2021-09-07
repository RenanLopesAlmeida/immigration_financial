import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:immigration_financial/utils/i18n/resources/resources.dart';
import 'package:provider/provider.dart';

import '../infra/config/config.dart';
import '../service_locator/service_locator.dart';

class AppInitializer {
  static Future<void> init() async {
    Provider.debugCheckInvalidValueType = null;
    await dotenv.load(fileName: ".env");
    SupaBase.init();
    ServiceLocatorConfig.init();
    R.load(Locale('pt_BR'));
  }
}
