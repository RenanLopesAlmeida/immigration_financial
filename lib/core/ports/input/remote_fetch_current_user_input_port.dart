import '../../domain/domain.dart';

abstract class RemoteFetchCurrentUserInputPort {
  Future<User?> fetchCurrentUser({String id});
}
