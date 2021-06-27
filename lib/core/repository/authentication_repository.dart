import 'package:injectable/injectable.dart';

import '../infra/protocols/authentication.dart';
import '../infra/config/config.dart';
import '../domain/user.dart';
import '../ports/output/remote_authenticate_output_port.dart';
import '../ports/input/remote_fetch_current_user_input_port.dart';
import '../error/domain_error.dart';

@singleton
class AuthenticationRepository implements RemoteAuthenticateOutputPort {
  const AuthenticationRepository({required this.currentUserInputPort});
  final RemoteFetchCurrentUserInputPort currentUserInputPort;

  Future<User?> authenticate(AuthenticationParams params) async {
    try {
      final response = await SupaBase.supabaseClient.auth
          .signIn(email: params.email, password: params.password);

      if (response.error != null) {
        throw DomainError.invalidCredentials;
      }

      final session = response.data;
      final userID = session?.user?.id;
      final token = response.data?.accessToken;

      if (session == null || userID == null || token == null) {
        return null;
      }

      return this.currentUserInputPort.fetchCurrentUser(id: userID);
    } on DomainError catch (exception) {
      throw exception;
    }
  }
}
