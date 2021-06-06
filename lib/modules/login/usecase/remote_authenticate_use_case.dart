import 'package:immigration_financial/core/domain/user.dart';
import 'package:immigration_financial/modules/login/ports/input/remote_authenticate_input_port.dart';
import 'package:immigration_financial/modules/login/ports/output/remote_authenticate_output_port.dart';
import 'package:immigration_financial/modules/login/protocols/remote_authenticate_params.dart';

class RemoteAuthenticateUseCase implements RemoteAuthenticateInputPort {
  const RemoteAuthenticateUseCase(this._outputPort);
  final RemoteAuthenticateOutputPort _outputPort;

  @override
  Future<User> authenticate(RemoteAuthenticateParams params) =>
      _outputPort.authenticate(params);
}
