part of 'app_router.dart';

class CatalogRoute extends GoRouteData with $CatalogRoute {
  const CatalogRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BooksViewModel>().load();
    });

    return ChangeNotifierProvider(
      create: (_) => CatalogUiState(),
      child: const CatalogScreen(),
    );
  }
}
