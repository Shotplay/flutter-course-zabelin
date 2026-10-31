import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/bloc/auth_bloc.dart';
import 'package:flutter_app/data/bloc/user_bloc.dart';
import 'package:flutter_app/data/store/auth_repository.dart';
import 'package:flutter_app/data/store/user_repository.dart';
import 'package:flutter_app/domain/entity/auth.dart';
import 'package:flutter_app/domain/entity/user.dart';
import 'package:flutter_app/domain/usecase/login_use_case.dart';
import 'package:flutter_app/domain/usecase/register_use_case.dart';
import 'package:flutter_app/domain/usecase/sign_out_use_case.dart';
import 'package:flutter_app/domain/usecase/user_fetch_use_case.dart';
import 'package:flutter_app/domain/usecase/user_load_use_case.dart';
import 'package:flutter_app/domain/usecase/user_toggle_book_like_use_case.dart';
import 'package:flutter_app/domain/usecase/watch_auth_state_use_case.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:flutter_app/router/app_router.dart';
import 'package:flutter_app/ui/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthFirebaseRepository(),
        ),
        RepositoryProvider<UserRepository>(
          create: (_) => UserFirebaseRepository(),
        ),

        RepositoryProvider(
          create: (context) =>
              WatchAuthStateUseCase(authRepo: context.read<AuthRepository>()),
        ),
        RepositoryProvider(
          create: (context) => RegisterUseCase(
            authRepo: context.read<AuthRepository>(),
            userRepo: context.read<UserRepository>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => LoginUseCase(
            authRepo: context.read<AuthRepository>(),
            userRepo: context.read<UserRepository>(),
          ),
        ),
        RepositoryProvider(
          create: (context) =>
              SignOutUseCase(authRepo: context.read<AuthRepository>()),
        ),

        RepositoryProvider(
          create: (context) =>
              UserLoadUseCase(userRepo: context.read<UserRepository>()),
        ),
        RepositoryProvider(
          create: (context) =>
              UserFetchUseCase(userRepo: context.read<UserRepository>()),
        ),
        RepositoryProvider(
          create: (context) => UserToggleBookLikeUseCase(
            userRepo: context.read<UserRepository>(),
          ),
        ),

        BlocProvider(
          create: (context) => UserBloc(
            userLoad: context.read<UserLoadUseCase>(),
            userFetch: context.read<UserFetchUseCase>(),
            userToggleBookLike: context.read<UserToggleBookLikeUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            watchAuthState: context.read<WatchAuthStateUseCase>(),
            authRegister: context.read<RegisterUseCase>(),
            authLogin: context.read<LoginUseCase>(),
            authSignOut: context.read<SignOutUseCase>(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          context.read<AuthBloc>().add(const AuthAppStartedEvent());

          return MaterialApp.router(
            debugShowCheckedModeBanner: true,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            routerConfig: AppRouter(context).router,
          );
        },
      ),
    );
  }
}
