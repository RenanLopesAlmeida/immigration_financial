import 'package:get/state_manager.dart';
import 'package:immigration_financial/core/ports/input/sign_up_input_port.dart';

import '../../../../core/core.dart';
import '../../sign_up.dart';

class GetxSignUpPresenter implements SignUpPresenter {
  GetxSignUpPresenter({
    required this.validation,
    required this.signUpInputPort,
    required this.localSaveCurrentAccount,
  });

  final Validation validation;
  final SignUpInputPort signUpInputPort;
  final LocalSaveCurrentAccountInputPort localSaveCurrentAccount;

  String? _email;
  String? _password;
  String? _name;
  String? _confirmedPassword;
  final _emailError = RxnString();
  final _nameError = RxnString();
  final _passwordError = RxnString();
  final _confirmPasswordError = RxnString();
  final _mainError = RxnString();
  final _navigateTo = RxnString();
  var _isFormValid = RxBool(false);
  final _isLoading = RxBool(false);

  Stream<String?> get nameErrorStream => _nameError.stream;

  Stream<String?> get emailErrorStream => _emailError.stream;

  Stream<bool?> get isFormValidStream => _isFormValid.stream;

  Stream<bool?> get isLoadingStream => _isLoading.stream;

  Stream<String?> get mainErrorStream => _mainError.stream;

  Stream<String?> get navigateToStream => _navigateTo.stream;

  Stream<String?> get passwordErrorStream => _passwordError.stream;

  Stream<String?> get confirmPasswordErrorStream =>
      _confirmPasswordError.stream;

  Future<void> signUp() async {
    final email = _email;
    final password = _password;

    if (_name == null || email == null || password == null) {
      return;
    }

    _isLoading.value = true;
    _mainError.value = null;

    try {
      final user = await signUpInputPort
          .signUp(SignUpParams(name: _name!, email: email, password: password));
      //final token = user?.token;

      if (user == null) {
        return;
      }

      //await localSaveCurrentAccount.saveAccount(AccountEntity(token!));
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
        (password.isNotEmpty && password.length >= 6) ? null : 'Weak Password';
    _validateForm();
  }

  void validateName(String name) {
    _name = name;
    _nameError.value = validation.validate(field: 'name', value: name);
    _validateForm();
  }

  void validateConfirmPassword(String confirmedPassword) {
    _confirmedPassword = confirmedPassword;
    _confirmPasswordError.value =
        (confirmedPassword.isNotEmpty && confirmedPassword == _password)
            ? null
            : 'Weak Password';
    _validateForm();
  }

  void _validateForm() {
    _isFormValid.value = (_nameError.value == null &&
        _emailError.value == null &&
        _passwordError.value == null &&
        _confirmPasswordError.value == null &&
        _name != null &&
        _email != null &&
        _password != null &&
        _confirmedPassword != null);
  }
}
