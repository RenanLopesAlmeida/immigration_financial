import '../builders/builders.dart';
import '../../../core/validation/protocols/protocols.dart';
import '../../../core/validation/validators/validators.dart';

Validation makeSignUpValidation() {
  return ValidationComposite(_makeSignUpValidations());
}

List<FieldValidation> _makeSignUpValidations() {
  return [
    ...ValidationBuilder.field('name')!.required().build(),
    ...ValidationBuilder.field('email')!.required().email().build(),
    ...ValidationBuilder.field('password')!.required().build(),
  ];
}
