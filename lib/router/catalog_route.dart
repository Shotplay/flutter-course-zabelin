part of 'app_router.dart';

class CatalogRoute extends GoRouteData with $CatalogRoute {
  const CatalogRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BooksBloc>().add(const BooksLoadEvent());
    });

    return BlocProvider(
      create: (_) => CatalogCubit(),
      child: const CatalogScreen(),
    );
  }
}
