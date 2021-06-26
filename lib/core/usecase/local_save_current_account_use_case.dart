import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../domain/account_entity.dart';
import '../ports/ports.dart';

@singleton
class LocalSaveCurrentAccountUseCase
    implements LocalSaveCurrentAccountInputPort {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  @override
  Future<void> saveAccount(AccountEntity accountEntity) async =>
      await secureStorage.write(key: 'token', value: accountEntity.token);
}
