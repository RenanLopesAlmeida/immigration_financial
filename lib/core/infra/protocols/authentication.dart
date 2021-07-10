import '../../domain/user.dart';

abstract class Authentication {
  Future<User> auth(AuthenticationParams params);
}

class AuthenticationParams {
  const AuthenticationParams({required this.email, required this.password});
  final String email;
  final String password;
}

class SignUpParams {
  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;
}
