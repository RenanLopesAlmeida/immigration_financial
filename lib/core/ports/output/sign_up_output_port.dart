import 'package:immigration_financial/core/domain/domain.dart';
import 'package:immigration_financial/core/infra/protocols/protocols.dart';

abstract class SignUpOutputPort {
  Future<User?> signUp(SignUpParams params);
}
