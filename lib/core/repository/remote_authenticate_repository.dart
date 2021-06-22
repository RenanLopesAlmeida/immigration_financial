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
    } on DomainError catch (exception) {
      throw exception;
    }
  }
}
