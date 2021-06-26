import '../../domain/domain.dart';

abstract class RemoteFetchCurrentUserOutputPort {
  Future<User?> fetchCurrentUser({required String id});
}
