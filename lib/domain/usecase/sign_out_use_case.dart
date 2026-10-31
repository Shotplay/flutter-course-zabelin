import 'package:flutter_app/domain/entity/auth.dart';

class SignOutUseCase {
  final AuthRepository authRepo;

  const SignOutUseCase({required this.authRepo});

  Future<bool> call() async {
    return await authRepo.signOut();
  }
}
