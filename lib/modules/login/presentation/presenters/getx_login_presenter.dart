import '../../../../core/infra/infra.dart';
import 'package:meta/meta.dart';
import 'package:get/state_manager.dart';

import '../../login.dart';

class GetxLoginPresenter implements LoginPresenter {
  GetxLoginPresenter({
    @required this.validation,
    @required this.authentication,
    //@required this.saveCurrentAccount,
  });

  final Validation validation;
  //final SaveCurrentAccount saveCurrentAccount;
  final Authentication authentication;

  String _email;
  String _password;
  var _emailError = RxString(null);
  var _passwordError = RxString(null);
  var _mainError = RxString(null);
  var _navigateTo = RxString(null);
  var _isFormValid = RxBool(false);
  var _isLoading = RxBool(false);

  Stream<String> get emailErrorStream => _emailError.stream;

  Stream<bool> get isFormValidStream => _isFormValid.stream;

  Stream<bool> get isLoadingStream => _isLoading.stream;

  Stream<String> get mainErrorStream => _mainError.stream;

  Stream<String> get navigateToStream => _navigateTo.stream;

  Stream<String> get passwordErrorStream => _passwordError.stream;

  Future<void> authenticate() async {
    final accountEntity = await authentication
        .auth(AuthenticationParams(email: _email, password: _password));

    //await saveCurrentAccount.save(accountEntity);
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