import 'package:meta/meta.dart';
import '../../domain/user.dart';

abstract class Authentication {
  Future<User> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String password;

  AuthenticationParams({required this.email, required this.password});
}
