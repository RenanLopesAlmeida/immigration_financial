import 'package:get/state_manager.dart';
import 'package:injectable/injectable.dart';

import '../protocols/splash_presenter.dart';
import '../../../core/ports/input/local_load_current_account_input_port.dart';

@singleton
class GetxSplashPresenter implements SplashPresenter {
  GetxSplashPresenter({required this.localLoadCurrentAccountInputPort});

  final LocalLoadCurrentAccountInputPort localLoadCurrentAccountInputPort;
  final _navigateTo = RxnString();

  Future<void> checkAccount({int durationInMilliseconds = 1500}) async {
    await Future.delayed(Duration(milliseconds: durationInMilliseconds))
        .then((value) async {
      try {
        final user = await localLoadCurrentAccountInputPort.load(
          accessTokenKey: 'token',
          uidKey: 'uid',
        );

        _navigateTo.value = user == null ? '/login' : '/dashboard';
      } catch (error) {
        _navigateTo.value = '/login';
      }
    });
  }

  Stream<String?> get navigateToStream => _navigateTo.stream;
}
