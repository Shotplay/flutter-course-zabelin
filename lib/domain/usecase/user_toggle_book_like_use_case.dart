import 'package:flutter_app/domain/entity/user.dart';

class UserToggleBookLikeUseCase {
  final UserRepository userRepo;

  const UserToggleBookLikeUseCase({required this.userRepo});

  Future<User> call(String id, String bookId) async {
    final user = await userRepo.getUser(id);
    final newLikes = {...user.likes};

    if (!newLikes.add(bookId)) newLikes.remove(bookId);

    final newUser = user.copyWith(likes: newLikes);
    await userRepo.saveUser(newUser);
    return await userRepo.getUser(id);
  }
}
