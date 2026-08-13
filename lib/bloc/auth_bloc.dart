

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_app/bloc/auth_events.dart';
import 'package:responsive_app/service/authrsevice.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<CheckEmailSubmitted>(_onCheckEmailSubmitted);
    on<SignUpSubmitted>(_onSignUpSubmitted);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LogoutSubmitted>(_onLogoutSubmitted);
  }

  // 1. معالجة فحص البريد
  Future<void> _onCheckEmailSubmitted(
    
    CheckEmailSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final isAvailable = await authRepository.checkEmailAvailability(event.email);
      emit(EmailCheckSuccess(
        email: event.email,
        isAvailable: isAvailable,
      ));
    } catch (e) {
      emit(AuthFailure(e.toString().replaceAll('Exception: ', '')));
    }
  }

  // 2. معالجة إنشاء حساب جديد
  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.createUser(
        name: event.name,
        email: event.email,
        password: event.password,
        avatar: event.avatar ?? 'https://picsum.photos/800',
      );
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthFailure(e.toString().replaceAll('Exception: ', '')));
    }
  }

  // 3. معالجة تسجيل الدخول
  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.login(
        email: event.email,
        password: event.password,
      );
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthFailure(e.toString().replaceAll('Exception: ', '')));
    }
  }

  // 4. معالجة تسجيل الخروج
  Future<void> _onLogoutSubmitted(
    LogoutSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    emit(AuthUnauthenticated());
  }
}