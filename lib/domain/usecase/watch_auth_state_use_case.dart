import 'package:flutter_app/domain/entity/auth.dart';

class WatchAuthStateUseCase {
  final AuthRepository authRepo;

  const WatchAuthStateUseCase({required this.authRepo});

  Stream<bool> call() => authRepo.isSignedIn;
}
