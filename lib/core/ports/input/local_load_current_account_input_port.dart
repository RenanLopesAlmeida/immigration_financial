import 'package:immigration_financial/core/domain/domain.dart';

abstract class LocalLoadCurrentAccountInputPort {
  Future<AccountEntity?> load({
    required String accessTokenKey,
    required String uidKey,
  });
}
