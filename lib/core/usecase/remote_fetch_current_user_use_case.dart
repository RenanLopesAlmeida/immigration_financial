import 'package:injectable/injectable.dart';

import '../domain/domain.dart';
import '../ports/input/remote_fetch_current_user_input_port.dart';
import '../ports/output/remote_fetch_current_user_output_port.dart';

@singleton
class RemoteFetchCurrentUserUseCase implements RemoteFetchCurrentUserInputPort {
  const RemoteFetchCurrentUserUseCase(this._outputPort);
  final RemoteFetchCurrentUserOutputPort _outputPort;

  @override
  Future<User?> fetchCurrentUser({required String id}) async =>
      _outputPort.fetchCurrentUser(id: id);
}
