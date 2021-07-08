import 'package:immigration_financial/core/domain/user.dart';
import 'package:immigration_financial/core/error/error.dart';
import 'package:immigration_financial/core/infra/config/config.dart';
import 'package:immigration_financial/core/ports/output/remote_fetch_current_user_output_port.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserRepository implements RemoteFetchCurrentUserOutputPort {
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
