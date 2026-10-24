part of 'app_router.dart';

@TypedShellRoute<BooksShellRoute>(
  routes: [
    TypedGoRoute<CatalogRoute>(path: '/catalog'),
    TypedGoRoute<BookAddRoute>(path: '/book/add'),
    TypedGoRoute<BookInfoRoute>(path: '/book/info/:bookId'),
  ],
)
class BooksShellRoute extends ShellRouteData {
  const BooksShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => BooksStore()),
        ChangeNotifierProvider(
          create: (context) =>
              BooksViewModel(store: context.read<BooksStore>()),
        ),
      ],
      child: navigator,
    );
  }
}
