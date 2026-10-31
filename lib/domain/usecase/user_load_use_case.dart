import 'package:flutter_app/domain/entity/user.dart';

class UserLoadUseCase {
  final UserRepository userRepo;

  const UserLoadUseCase({required this.userRepo});

  Future<User> call(String id) async {
    return await userRepo.getUser(id);
  }
}
