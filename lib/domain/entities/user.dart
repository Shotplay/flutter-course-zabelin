class User {
  final Set<String> likes;

  const new({required this.likes});

  User copyWith({Set<String>? likes}) {
    return User(likes: likes ?? this.likes);
  }
}
