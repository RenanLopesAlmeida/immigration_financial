import '../../protocols/protocols.dart';
import '../../../../core/core.dart';

abstract class RemoteAuthenticateOutputPort {
  Future<User> authenticate(RemoteAuthenticateParams params);
}
