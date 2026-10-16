import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserSessionState { none, loading, togglingLike, disposed }

@freezed
abstract class User with _$User {
  const factory User({required String id, required Set<String> likedBooks}) =
      _User;

  static User get zero => User(id: "", likedBooks: {});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
