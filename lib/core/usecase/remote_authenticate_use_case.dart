import '../../core/core.dart';

class RemoteAuthenticateUseCase implements RemoteAuthenticateInputPort {
  const RemoteAuthenticateUseCase(this._outputPort);
  final RemoteAuthenticateOutputPort _outputPort;

  @override
  Future<User> authenticate(AuthenticationParams params) =>
      _outputPort.authenticate(params);
}
