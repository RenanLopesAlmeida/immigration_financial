import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

//part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  const User({
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.confirmedPassword,
    @required this.token,
    @required this.id,
  });

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'confirmedPassword')
  final String confirmedPassword;
  @JsonKey(name: 'token')
  final String token;
}
