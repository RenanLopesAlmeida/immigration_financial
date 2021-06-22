import 'package:immigration_financial/core/error/domain_error.dart';
import 'package:injectable/injectable.dart';

import '../ports/ports.dart';
import '../infra/protocols/authentication.dart';
import '../infra/config/config.dart';
import '../domain/user.dart';

@singleton
class RemoteAuthenticateRepository implements RemoteAuthenticateOutputPort {
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

      if (session == null ||
          session.user == null ||
          userID == null ||
          token == null) {
        return null;
      }

      final user = User(
          email: params.email,
          id: userID,
          token: token,
          password: params.password,
          name: null,
          confirmedPassword: null);

      return user;
    } on DomainError catch (exception) {
      throw exception;
    }
  }
}
