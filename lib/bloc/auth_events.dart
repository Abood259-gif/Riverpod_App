

import 'package:meta/meta.dart';

@immutable
sealed class AuthEvent {}


final class CheckEmailSubmitted extends AuthEvent {
  final String email;
  CheckEmailSubmitted(this.email);
}


final class SignUpSubmitted extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String? avatar;

  SignUpSubmitted({
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
  });
}


final class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  LoginSubmitted({
    required this.email,
    required this.password,
  });
}


final class LogoutSubmitted extends AuthEvent {}