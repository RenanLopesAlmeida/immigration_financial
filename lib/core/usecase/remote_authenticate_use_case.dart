import 'package:injectable/injectable.dart';

import '../domain/domain.dart';
import '../infra/protocols/protocols.dart';
import '../ports/input/remote_authenticate_input_port.dart';
import '../ports/output/remote_authenticate_output_port.dart';

@singleton
class RemoteAuthenticateUseCase implements RemoteAuthenticateInputPort {
  const RemoteAuthenticateUseCase(this._outputPort);
  final RemoteAuthenticateOutputPort _outputPort;

  @override
  Future<User?> authenticate(AuthenticationParams params) =>
      _outputPort.authenticate(params);
}
