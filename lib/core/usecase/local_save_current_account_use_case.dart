import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../domain/account_entity.dart';
import '../ports/input/local_save_current_account_input_port.dart';

@singleton
class LocalSaveCurrentAccountUseCase
    implements LocalSaveCurrentAccountInputPort {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  @override
  Future<void> saveAccount(AccountEntity accountEntity) async {
    await secureStorage.write(key: 'token', value: accountEntity.token);
    await secureStorage.write(key: 'uid', value: accountEntity.uid);
  }
}
