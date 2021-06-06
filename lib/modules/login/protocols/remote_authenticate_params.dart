import 'package:meta/meta.dart';

class RemoteAuthenticateParams {
  const RemoteAuthenticateParams({
    @required this.email,
    @required this.password,
  });

  final String email;
  final String password;
}
