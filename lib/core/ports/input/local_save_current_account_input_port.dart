import '../../domain/domain.dart';

abstract class LocalSaveCurrentAccountInputPort {
  Future<void> saveAccount(AccountEntity accountEntity);
}
