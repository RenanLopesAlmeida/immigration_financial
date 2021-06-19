import 'package:immigration_financial/core/infra/config/config.dart';
import 'package:injectable/injectable.dart';

import '../infra/protocols/authentication.dart';
import '../domain/user.dart';
import '../ports/ports.dart';

@singleton
class RemoteAuthenticateRepository implements RemoteAuthenticateOutputPort {
  Future<User?> authenticate(AuthenticationParams params) async {
    final response = await SupaBase.supabaseClient.auth
        .signIn(email: params.email, password: params.password);

    if (response.error != null) {
      print('ERROR: ${response.error?.message}');
    }
  }
}
