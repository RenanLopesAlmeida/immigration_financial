import 'package:injectable/injectable.dart';
import 'package:postgrest/postgrest.dart';

import '../infra/protocols/authentication.dart';
import '../infra/config/config.dart';
import '../domain/domain.dart';
import '../domain/user.dart';
import '../ports/output/sign_up_output_port.dart';
import '../ports/output/remote_authenticate_output_port.dart';
import '../ports/input/remote_fetch_current_user_input_port.dart';
import '../ports/input/local_save_current_account_input_port.dart';
import '../error/domain_error.dart';

@singleton
class AuthenticationRepository
    implements RemoteAuthenticateOutputPort, SignUpOutputPort {
  const AuthenticationRepository({
    required this.currentUserInputPort,
    required this.localSaveCurrentAccountInputPort,
  });

  final RemoteFetchCurrentUserInputPort currentUserInputPort;
  final LocalSaveCurrentAccountInputPort localSaveCurrentAccountInputPort;

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

      await localSaveCurrentAccountInputPort.saveAccount(
        AccountEntity(token: token, uid: userID),
      );

      return await this.currentUserInputPort.fetchCurrentUser();
    } on DomainError catch (exception) {
      throw exception;
    }
  }

  Future<User?> signUp(SignUpParams params) async {
    try {
      final response = await SupaBase.supabaseClient.auth.signUp(
        params.email,
        params.password,
      );

      if (response.error != null) {
        throw DomainError.emailAlreadyExists;
      }

      final session = response.data;
      final supabaseUser = session?.user;

      if (session == null || supabaseUser == null) {
        throw DomainError.unexpected;
      }

      final user = User(
        id: supabaseUser.id,
        name: params.name,
        email: supabaseUser.email,
      );

      final userCreationResponse = await _createUser(user);
      await localSaveCurrentAccountInputPort.saveAccount(
        AccountEntity(token: session.accessToken, uid: user.id),
      );

      if (userCreationResponse.error != null) {
        print(userCreationResponse.error?.message);
      }
      return this.currentUserInputPort.fetchCurrentUser();
    } on DomainError catch (exception) {
      throw exception;
    }
  }

  Future<PostgrestResponse> _createUser(User user) async {
    return SupaBase.supabaseClient
        .from('app_users')
        .insert(user.toJson())
        .execute();
  }
}
