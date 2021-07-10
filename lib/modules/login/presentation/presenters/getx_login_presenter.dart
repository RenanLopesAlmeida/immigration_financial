import 'package:get/state_manager.dart';

import '../../../../core/core.dart';
import '../../login.dart';

class GetxLoginPresenter implements LoginPresenter {
  GetxLoginPresenter({
    required this.validation,
    required this.remoteAuthenticateInputPort,
    required this.localSaveCurrentAccount,
  });

  final Validation validation;
  final RemoteAuthenticateInputPort remoteAuthenticateInputPort;
  final LocalSaveCurrentAccountInputPort localSaveCurrentAccount;

  String? _email;
  String? _password;
  final _emailError = RxnString();
  final _passwordError = RxnString();
  final _mainError = RxnString();
  final _navigateTo = RxnString();
  var _isFormValid = RxBool(false);
  final _isLoading = RxBool(false);

  Stream<String?> get emailErrorStream => _emailError.stream;

  Stream<bool?> get isFormValidStream => _isFormValid.stream;

  Stream<bool?> get isLoadingStream => _isLoading.stream;

  Stream<String?> get mainErrorStream => _mainError.stream;

  Stream<String?> get navigateToStream => _navigateTo.stream;

  Stream<String?> get passwordErrorStream => _passwordError.stream;

  Future<void> authenticate() async {
    final email = _email;
    final password = _password;

    if (email == null || password == null) {
      return;
    }

    _isLoading.value = true;
    _mainError.value = null;

    try {
      final user = await remoteAuthenticateInputPort
          .authenticate(AuthenticationParams(email: email, password: password));

      if (user == null && user?.token == null) {
        return;
      }

      await localSaveCurrentAccount.saveAccount(AccountEntity(user!.token!));
      _isLoading.value = false;
    } on DomainError catch (error) {
      _isLoading.value = false;
      _mainError.value = error.description;
    }
  }

  void dispose() {}

  void validateEmail(String email) {
    _email = email;
    _emailError.value = validation.validate(field: 'email', value: email);
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value =
        validation.validate(field: 'password', value: password);
    _validateForm();
  }

  void _validateForm() {
    _isFormValid.value = (_emailError.value == null &&
        _passwordError.value == null &&
        _email != null &&
        _password != null);
  }
}
