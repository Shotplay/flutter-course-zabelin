import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_app/domain/entity/auth.dart';
import 'package:flutter_app/domain/usecase/login_use_case.dart';
import 'package:flutter_app/domain/usecase/register_use_case.dart';
import 'package:flutter_app/domain/usecase/sign_out_use_case.dart';
import 'package:flutter_app/domain/usecase/watch_auth_state_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class AuthAppStartedEvent extends AuthEvent {
  const AuthAppStartedEvent();
}

class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthSignInEvent(this.email, this.password);
}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthSignUpEvent(this.email, this.password);
}

class AuthSignOutEvent extends AuthEvent {
  const AuthSignOutEvent();
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final WatchAuthStateUseCase watchAuthState;
  final RegisterUseCase authRegister;
  final LoginUseCase authLogin;
  final SignOutUseCase authSignOut;

  AuthBloc({
    required this.watchAuthState,
    required this.authRegister,
    required this.authLogin,
    required this.authSignOut,
  }) : super(const AuthUnauthenticatedState()) {
    on<AuthAppStartedEvent>(_onAppStarted, transformer: droppable());
    on<AuthSignInEvent>(_onSignIn, transformer: droppable());
    on<AuthSignUpEvent>(_onSignUp, transformer: droppable());
    on<AuthSignOutEvent>(_onSignOut, transformer: droppable());
  }

  Future<void> _onAppStarted(
    AuthAppStartedEvent event,
    Emitter<AuthState> emit,
  ) async {
    await emit.forEach(
      watchAuthState(),
      onData: (isSignedIn) => isSignedIn
          ? const AuthAuthenticatedState()
          : const AuthUnauthenticatedState(),
    );
  }

  Future<void> _onSignIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());
    try {
      await authLogin(email: event.email, password: event.password);
      emit(const AuthAuthenticatedState());
    } on Object catch (e) {
      emit(AuthFailureState(e));
    }
  }

  Future<void> _onSignUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());
    try {
      await authRegister(email: event.email, password: event.password);
      emit(const AuthAuthenticatedState());
    } on Object catch (e) {
      emit(AuthFailureState(e));
    }
  }

  Future<void> _onSignOut(
    AuthSignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());
    try {
      await authSignOut();
      emit(const AuthUnauthenticatedState());
    } on Object catch (e) {
      emit(AuthFailureState(e));
    }
  }
}
