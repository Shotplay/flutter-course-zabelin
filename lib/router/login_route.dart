part of 'app_router.dart';

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final authBloc = context.read<AuthBloc>();

    if (authBloc.state is AuthFailureState) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Произошла ошибка, проверьте подключение к интернету, корректность введенных данных или попробуйте позже",
            ),
          ),
        ),
      );
    }

    return const LoginScreen();
  }
}
