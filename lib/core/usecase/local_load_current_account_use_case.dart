import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../domain/account_entity.dart';
import '../ports/input/local_load_current_account_input_port.dart';
import '../error/error.dart';

@singleton
class LocalLoadCurrentAccountUseCase
    implements LocalLoadCurrentAccountInputPort {
  @override
  Future<AccountEntity?> load({required String key}) async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();

    try {
      final token = await secureStorage.read(key: key);

      if (token == null) {
        return null;
      }

      return AccountEntity(token);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
