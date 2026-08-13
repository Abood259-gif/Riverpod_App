

import 'package:meta/meta.dart';
import 'package:responsive_app/model/usermodel.dart';


@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}


final class EmailCheckSuccess extends AuthState {
  final String email;
  final bool isAvailable; 

  EmailCheckSuccess({required this.email, required this.isAvailable});
}


final class AuthAuthenticated extends AuthState {
  final UserModel user;
  AuthAuthenticated(this.user);
}


final class AuthUnauthenticated extends AuthState {}


final class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure(this.errorMessage);
}