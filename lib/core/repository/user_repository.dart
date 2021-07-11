import 'package:immigration_financial/core/domain/user.dart';
import 'package:immigration_financial/core/error/error.dart';
import 'package:immigration_financial/core/infra/config/config.dart';
import 'package:immigration_financial/core/ports/input/local_load_current_account_input_port.dart';
import 'package:immigration_financial/core/ports/output/remote_fetch_current_user_output_port.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserRepository implements RemoteFetchCurrentUserOutputPort {
  const UserRepository({required this.localLoadCurrentAccountInputPort});

  final LocalLoadCurrentAccountInputPort localLoadCurrentAccountInputPort;

  Future<User?> _fetchUserInfoById({required String id}) async {
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

      if (data == null) {
        return null;
      }

      return User.fromJson(data);
    } on DomainError catch (exception) {
      throw exception;
    }
  }

  Future<User?> fetchCurrentUser() async {
    try {
      final currentUser = await localLoadCurrentAccountInputPort.load(
          accessTokenKey: 'token', uidKey: 'uid');

      if (currentUser == null) {
        return null;
      }

      return _fetchUserInfoById(id: currentUser.uid);
    } on DomainError catch (exception) {
      throw exception;
    }
  }
}
