import 'package:immigration_financial/core/infra/protocols/authentication.dart';
import 'package:immigration_financial/core/domain/user.dart';
import 'package:immigration_financial/core/ports/input/sign_up_input_port.dart';
import 'package:immigration_financial/core/ports/output/sign_up_output_port.dart';
import 'package:injectable/injectable.dart';

@singleton
class SignUpUseCase implements SignUpInputPort {
  const SignUpUseCase(this._outputPort);
  final SignUpOutputPort _outputPort;

  Future<User?> signUp(SignUpParams params) => _outputPort.signUp(params);
}
