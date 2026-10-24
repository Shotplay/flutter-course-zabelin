import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/domain/value_object/email.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    @EmailConverter() required Email email,
    required UserData data,
  }) = _User;
}

@freezed
sealed class UserData with _$UserData {
  const factory UserData({required Set<String> likedBooks}) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  factory UserData.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserData(
      likedBooks: (data['likedBooks'] as List<dynamic>)
          .map((e) => e as String)
          .where((e) => e.isNotEmpty)
          .toSet(),
    );
  }

  static UserData get zero => const UserData(likedBooks: {});
}
