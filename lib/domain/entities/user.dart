class User {
  final Set<String> likes;

  const User({required this.likes});

  User copyWith({Set<String>? likes}) {
    return User(likes: likes ?? this.likes);
  }
}
