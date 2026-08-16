import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_app/model/usermodel.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.authInitial() = AuthInitial;

  const factory AuthState.authLoading() = AuthLoading;

  const factory AuthState.emailCheckSuccess({
    required String email,
    required bool isAvailable,
  }) = EmailCheckSuccess;

  const factory AuthState.authAuthenticated(UserModel user) = AuthAuthenticated;

  const factory AuthState.authUnauthenticated() = AuthUnauthenticated;

  const factory AuthState.authFailure(String errorMessage) = AuthFailure;
}