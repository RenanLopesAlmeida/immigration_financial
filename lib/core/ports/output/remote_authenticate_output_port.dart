import '../../core.dart';

abstract class RemoteAuthenticateOutputPort {
  Future<User> authenticate(AuthenticationParams params);
}
