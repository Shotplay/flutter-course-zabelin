part of 'app_router.dart';

class BookInfoRoute extends GoRouteData with $BookInfoRoute {
  final String bookId;

  const BookInfoRoute({required this.bookId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BookInfoScreen(bookId: bookId);
  }
}

class BookAddRoute extends GoRouteData with $BookAddRoute {
  const BookAddRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BookAddScreen();
  }
}
