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
    await Future.delayed(Duration(milliseconds: durationInMilliseconds));
    try {
      final account = await localLoadCurrentAccountInputPort.load(key: 'token');
      _navigateTo.value = account == null ? '/login' : '/home';
    } catch (error) {
      _navigateTo.value = '/login';
    }
  }

  Stream<String?> get navigateToStream => _navigateTo.stream;
}
