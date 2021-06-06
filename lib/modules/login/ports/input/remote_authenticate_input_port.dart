import '../../protocols/protocols.dart';
import '../../../../core/core.dart';

abstract class RemoteAuthenticateInputPort {
  Future<User> authenticate(RemoteAuthenticateParams params);
}
