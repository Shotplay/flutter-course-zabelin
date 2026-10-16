import 'package:flutter/material.dart';
import 'package:flutter_app/data/providers/app_provider.dart';
import 'package:flutter_app/data/providers/catalog_provider.dart';
import 'package:flutter_app/data/store/books_store.dart';
import 'package:flutter_app/data/store/user_store.dart';
import 'package:flutter_app/data/user_session.dart';
import 'package:flutter_app/domain/entities/user.dart';
import 'package:flutter_app/ui/screens/catalog_screen.dart';
import 'package:flutter_app/ui/screens/user_choice_screen.dart';
import 'package:flutter_app/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var userStore = UserStore();
    var booksStore = BooksStore();

    var catalogScreen = CatalogProvider(
      booksStore: booksStore,
      child: CatalogScreen(),
    );

    return AppProvider(
      userStore: userStore,
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(fontFamily: "Inter"),
        home: Builder(
          builder: (context) {
            final userSession = context.watch<UserSession>();
            if (userSession.state == UserSessionState.loading) {
              return Scaffold(body: SafeArea(child: Loading()));
            }

            if (!userSession.isLoaded) {
              return UserChoiceScreen();
            }

            return catalogScreen;
          },
        ),
      ),
    );
  }
}
