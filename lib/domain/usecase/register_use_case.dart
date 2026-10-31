import 'package:flutter_app/domain/entity/auth.dart';
import 'package:flutter_app/domain/entity/user.dart';
import 'package:flutter_app/utils/value_objects.dart';

class RegisterUseCase {
  final AuthRepository authRepo;
  final UserRepository userRepo;

  const RegisterUseCase({required this.authRepo, required this.userRepo});

  Future<User> call({required String email, required String password}) async {
    final normalizedPass = password.trim();

    await authRepo.signUp(email.toEmail(), normalizedPass);
    return await userRepo.createUser(authRepo.userId!);
  }
}
