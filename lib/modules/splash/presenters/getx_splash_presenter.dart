import 'package:get/state_manager.dart';

import '../protocols/protocols.dart';

class GetxSplashPresenter implements SplashPresenter {
  final _navigateTo = RxnString();

  Future<void> checkAccount({int? durationInMilliseconds}) async {}

  Stream<String?> get navigateToStream => _navigateTo.stream;
}
