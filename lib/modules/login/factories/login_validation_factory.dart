import '../login.dart';
import '../builders/builders.dart';
import '../../../core/validation/protocols/protocols.dart';
import '../../../core/validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite(_makeLoginValidations());
}

List<FieldValidation> _makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().build(),
  ];
}
