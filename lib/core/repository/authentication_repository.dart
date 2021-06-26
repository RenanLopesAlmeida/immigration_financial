import 'package:immigration_financial/core/error/domain_error.dart';
import 'package:immigration_financial/core/ports/output/remote_fetch_current_user_output_port.dart';
import 'package:injectable/injectable.dart';

import '../ports/ports.dart';
import '../infra/protocols/authentication.dart';
import '../infra/config/config.dart';
import '../domain/user.dart';

@singleton
class AuthenticationRepository
    implements RemoteAuthenticateOutputPort, RemoteFetchCurrentUserOutputPort {
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

      return fetchCurrentUser(id: userID);
    } on DomainError catch (exception) {
      throw exception;
    }
  }

  @override
  Future<User?> fetchCurrentUser({required String id}) async {
    try {
      final response = await SupaBase.supabaseClient
          .from('app_users')
          .select()
          .eq('id', id)
          .single()
          .execute();

      if (response.error != null || response.status != 200) {
        throw DomainError.notFound;
      }

      final data = response.data;
      final token = response.data?.accessToken;

      if (data == null || token == null) {
        return null;
      }

      final user = User.fromJson(data);
      return user;
    } on DomainError catch (exception) {
      throw exception;
    }
  }
}
