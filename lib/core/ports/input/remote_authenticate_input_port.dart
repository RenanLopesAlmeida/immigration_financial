import '../../core.dart';

abstract class RemoteAuthenticateInputPort {
  Future<User?> authenticate(AuthenticationParams params);
}
