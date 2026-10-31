import 'package:flutter_app/domain/entity/auth.dart';
import 'package:flutter_app/domain/entity/user.dart';
import 'package:flutter_app/utils/value_objects.dart';

class LoginUseCase {
  final AuthRepository authRepo;
  final UserRepository userRepo;

  const LoginUseCase({required this.authRepo, required this.userRepo});

  Future<User> call({required String email, required String password}) async {
    final normalizedPass = password.trim();

    await authRepo.signIn(email.toEmail(), normalizedPass);
    return await userRepo.fetchUser(authRepo.userId!);
  }
}
