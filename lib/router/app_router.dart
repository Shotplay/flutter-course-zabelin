import 'package:flutter/material.dart';
import 'package:flutter_app/data/bloc/auth_bloc.dart';
import 'package:flutter_app/data/bloc/books_bloc.dart';
import 'package:flutter_app/data/bloc/user_bloc.dart';
import 'package:flutter_app/data/cubit/catalog_cubit.dart';
import 'package:flutter_app/data/store/books_repository.dart';
import 'package:flutter_app/domain/entity/auth.dart';
import 'package:flutter_app/domain/entity/book.dart';
import 'package:flutter_app/domain/entity/user.dart';
import 'package:flutter_app/domain/usecase/book_add_use_case.dart';
import 'package:flutter_app/domain/usecase/book_load_use_case.dart';
import 'package:flutter_app/domain/usecase/books_fetch_use_case.dart';
import 'package:flutter_app/domain/usecase/books_load_use_case.dart';
import 'package:flutter_app/ui/screens/book_add_screen.dart';
import 'package:flutter_app/ui/screens/book_info_screen.dart';
import 'package:flutter_app/ui/screens/catalog_screen.dart';
import 'package:flutter_app/ui/screens/login_screen.dart';
import 'package:flutter_app/ui/screens/register_screen.dart';
import 'package:flutter_app/ui/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bloc_listenable/bloc_listenable.dart';

part 'app_router.g.dart';
part 'login_route.dart';
part 'register_route.dart';
part 'shell_routes.dart';
part 'catalog_route.dart';
part 'splash_route.dart';
part 'book_routes.dart';

@immutable
class AppRouter {
  final BuildContext context;

  const AppRouter(this.context);

  GoRouter get router {
    return GoRouter(
      initialLocation: '/catalog',
      routes: $appRoutes,
      refreshListenable: context.read<AuthBloc>().asListenable(),
      redirect: (context, state) {
        final authBloc = context.read<AuthBloc>();
        final userBloc = context.read<UserBloc>();
        final isLoggingIn = state.matchedLocation == '/login';
        final isRegisterIn = state.matchedLocation == '/register';
        final isSplash = state.matchedLocation == '/splash';
        final isAuthScreen = isLoggingIn || isRegisterIn;

        if (authBloc.state is AuthUnauthenticatedState ||
            authBloc.state is AuthFailureState) {
          return isAuthScreen ? null : const LoginRoute().location;
        }

        if (authBloc.state is AuthLoadingState) {
          return const SplashRoute().location;
        }

        if (userBloc.state is UserInitialState &&
            authBloc.state is AuthAuthenticatedState) {
          userBloc.add(UserLoadEvent(context.read<AuthRepository>().userId!));
        }

        if (isSplash || isAuthScreen) {
          return const CatalogRoute().location;
        }

        return null;
      },
    );
  }
}
