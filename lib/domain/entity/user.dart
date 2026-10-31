import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/domain/value_object/email.dart';
import 'package:flutter_app/utils/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

abstract class UserRepository {
  Future<User> getUser(String id);
  Future<User> createUser(String id);
  Future<bool> saveUser(User user);
  Future<User> fetchUser(String id);
}

sealed class UserState {
  const UserState();
}

class UserInitialState extends UserState {
  const UserInitialState();
}

class UserLoadingState extends UserState {
  const UserLoadingState();
}

class UserLoadedState extends UserState {
  final User user;

  const UserLoadedState(this.user);
}

class UserFailureState extends UserState {
  final Object? error;

  const UserFailureState(this.error);
}

@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    @EmailConverter() required Email email,
    required Set<String> likes,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return User(
      id: doc.id,
      email: Email(data['email']),
      likes: (data['likes'] as List<dynamic>)
          .map((e) => e as String)
          .where((e) => e.isNotEmpty)
          .toSet(),
    );
  }

  static User get zero => User(id: "", email: "".toEmail(), likes: {});
}
