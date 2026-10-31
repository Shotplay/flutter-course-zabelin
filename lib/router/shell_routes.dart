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
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<BooksRepository>(
          create: (_) => BooksFirebaseRepository(),
        ),
        RepositoryProvider(
          create: (context) =>
              BookAddUseCase(booksRepo: context.read<BooksRepository>()),
        ),
        RepositoryProvider(
          create: (context) =>
              BookLoadUseCase(booksRepo: context.read<BooksRepository>()),
        ),
        RepositoryProvider(
          create: (context) =>
              BooksLoadUseCase(booksRepo: context.read<BooksRepository>()),
        ),
        RepositoryProvider(
          create: (context) =>
              BooksFetchUseCase(booksRepo: context.read<BooksRepository>()),
        ),
        BlocProvider(
          create: (context) => BooksBloc(
            addBook: context.read<BookAddUseCase>(),
            bookLoad: context.read<BookLoadUseCase>(),
            booksLoad: context.read<BooksLoadUseCase>(),
            booksFetch: context.read<BooksFetchUseCase>(),
          ),
        ),
      ],
      child: navigator,
    );
  }
}
