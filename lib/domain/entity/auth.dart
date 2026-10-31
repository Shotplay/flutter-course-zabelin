import 'package:flutter_app/domain/value_object/email.dart';

abstract class AuthRepository {
  Stream<bool> get isSignedIn;
  String? get userId;
  Future<bool> signUp(Email email, String password);
  Future<bool> signIn(Email email, String password);
  Future<bool> signOut();
}

sealed class AuthState {
  const AuthState();
}

class AuthUnauthenticatedState extends AuthState {
  const AuthUnauthenticatedState();
}

class AuthAuthenticatedState extends AuthState {
  const AuthAuthenticatedState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}


class AuthFailureState extends AuthState {
  final Object? error;

  const AuthFailureState(this.error);
}
