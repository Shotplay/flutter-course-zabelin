import 'package:flutter/material.dart';
import 'package:flutter_app/data/states/books_view_model.dart';
import 'package:flutter_app/data/states/catalog_ui_state.dart';
import 'package:flutter_app/data/states/user_view_model.dart';
import 'package:flutter_app/data/store/books_store.dart';
import 'package:flutter_app/ui/screens/book_add_screen.dart';
import 'package:flutter_app/ui/screens/book_info_screen.dart';
import 'package:flutter_app/ui/screens/catalog_screen.dart';
import 'package:flutter_app/ui/screens/login_screen.dart';
import 'package:flutter_app/ui/screens/register_screen.dart';
import 'package:flutter_app/ui/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
      refreshListenable: context.read<UserViewModel>(),
      routes: $appRoutes,
      redirect: (context, state) {
        final userVM = context.read<UserViewModel>();
        final isLoggingIn = state.matchedLocation == '/login';
        final isRegisterIn = state.matchedLocation == '/register';
        final isSplash = state.matchedLocation == '/splash';
        final isAuthScreen = isLoggingIn || isRegisterIn;

        if (userVM.state is UserLoading) {
          return const SplashRoute().location;
        }

        if (!userVM.isLoaded && userVM.state is! UserError && !isAuthScreen) {
          return const LoginRoute().location;
        }

        if (isSplash || (isAuthScreen && userVM.isLoaded)) {
          return (userVM.isLoaded || userVM.state is UserError)
              ? const CatalogRoute().location
              : const LoginRoute().location;
        }

        return null;
      },
    );
  }
}
