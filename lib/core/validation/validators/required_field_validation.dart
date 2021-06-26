import 'package:immigration_financial/core/validation/protocols/field_validation.dart';

class RequiredFieldValidation implements FieldValidation {
  const RequiredFieldValidation(this.field);
  final String? field;

  @override
  String? validate(String? value) {
    return (value?.isNotEmpty == true) ? null : 'Required field';
  }
}
