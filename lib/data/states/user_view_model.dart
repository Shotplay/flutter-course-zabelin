import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:flutter_app/data/store/user_store.dart';
import 'package:flutter_app/domain/entity/user.dart';
import 'package:flutter_app/utils/value_objects.dart';

sealed class UserState {
  const UserState();
}

final class UserInitial extends UserState {
  const UserInitial();
}

final class UserUnauthorized extends UserState {
  final Object? error;

  const UserUnauthorized({this.error});
}

final class UserLoading extends UserState {
  const UserLoading();
}

final class UserUpdating extends UserState {
  final User user;

  const UserUpdating(this.user);
}

final class UserLoaded extends UserState {
  final User user;

  const UserLoaded(this.user);
}

final class UserError extends UserState {
  final Object error;
  final User previousUser;

  const UserError(this.error, {required this.previousUser});
}

class UserViewModel extends ChangeNotifier {
  final UserStore store;

  UserViewModel._({required this.store});

  factory UserViewModel({required UserStore store}) {
    final userVM = UserViewModel._(store: store);
    final currentUser = FirebaseAuth.instance.currentUser;

    FirebaseAuth.instance.authStateChanges().listen((u) {
      if (u == null) userVM._setState(UserUnauthorized());
    });

    if (currentUser != null) {
      userVM._setState(UserLoading());
      userVM
          ._fetchUser(currentUser.uid, currentUser.email!)
          .then((u) => userVM._setState(UserLoaded(u)));
    }

    return userVM;
  }

  UserState _state = const UserInitial();

  UserState get state => _state;
  bool get isBusy => _state is UserLoading || _state is UserUpdating;
  bool get isLoaded => _state is UserLoaded || _state is UserUpdating;

  Future<bool> toggleBookLike(String bookId) async {
    if (state is! UserLoaded) return false;

    final currentUser = (_state as UserLoaded).user;
    final currentData = currentUser.data;
    final likes = {...currentData.likedBooks};

    if (!likes.add(bookId)) likes.remove(bookId);

    final newData = currentData.copyWith(likedBooks: likes);
    final newUser = currentUser.copyWith(data: newData);
    _setState(UserUpdating(newUser));
    try {
      await store.updateUserData(newUser.id, newData);
      _setState(UserLoaded(newUser));
      return true;
    } catch (e) {
      _setState(UserError(e, previousUser: currentUser));
      return false;
    }
  }

  Future<bool> refresh() async {
    if (_state is! UserLoaded && _state is! UserError) return false;

    final current = switch (_state) {
      UserError(:final previousUser) => previousUser,
      UserLoaded(:final user) => user,
      _ => null,
    };

    _setState(UserUpdating(current!));
    try {
      final newData = await store.fetchUserData(current.id);
      _setState(UserLoaded(current.copyWith(data: newData)));
      return true;
    } on Object catch (e) {
      _setState(UserError(e, previousUser: current));
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    if (state is! UserInitial && state is! UserUnauthorized) return false;

    _setState(const UserLoading());
    try {
      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.toEmail().toString(),
        password: password.trim(),
      );

      final uid = cred.user!.uid;
      _setState(UserLoaded(await _fetchUser(uid, cred.user!.email!)));
      return true;
    } catch (e) {
      logout(e);
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    if (state is! UserInitial && state is! UserUnauthorized) return false;

    _setState(const UserLoading());
    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.toEmail().toString(),
        password: password.trim(),
      );

      final uid = cred.user!.uid;
      await store.createUserData(uid);
      _setState(UserLoaded(await _fetchUser(uid, cred.user!.email!)));
      return true;
    } catch (e) {
      logout(e);
      return false;
    }
  }

  Future<void> logout(Object? error) async {
    await FirebaseAuth.instance.signOut();
    _setState(UserUnauthorized(error: error));
  }

  Future<User> _fetchUser(String uid, String email) async {
    return User(
      id: uid,
      email: email.toEmail(),
      data: await store.fetchUserData(uid),
    );
  }

  void _setState(UserState s) {
    _state = s;
    notifyListeners();
  }
}
