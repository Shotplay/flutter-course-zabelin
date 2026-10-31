import 'package:flutter_app/domain/entity/user.dart';

class UserFetchUseCase {
  final UserRepository userRepo;

  const UserFetchUseCase({required this.userRepo});

  Future<User> call(String id) async {
    return await userRepo.fetchUser(id);
  }
}
