import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/domain/entity/auth.dart';
import 'package:flutter_app/domain/value_object/email.dart';

class AuthFirebaseRepository implements AuthRepository {
  AuthFirebaseRepository();

  final _auth = FirebaseAuth.instance;

  @override
  String? get userId => FirebaseAuth.instance.currentUser?.uid;

  @override
  Stream<bool> get isSignedIn => _auth.authStateChanges().map((u) => u != null);

  @override
  Future<bool> signIn(Email email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email.toString(),
      password: password,
    );
    return true;
  }

  @override
  Future<bool> signUp(Email email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email.toString(),
      password: password,
    );
    return true;
  }

  @override
  Future<bool> signOut() async {
    await _auth.signOut();
    return true;
  }
}
