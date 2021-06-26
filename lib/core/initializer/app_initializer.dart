import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../infra/config/config.dart';
import '../service_locator/service_locator.dart';

class AppInitializer {
  static Future<void> init() async {
    Provider.debugCheckInvalidValueType = null;
    await dotenv.load(fileName: ".env");
    SupaBase.init();
    ServiceLocatorConfig.init();
  }
}
