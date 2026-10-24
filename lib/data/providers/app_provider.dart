import 'package:flutter/material.dart';
import 'package:flutter_app/data/store/user_store.dart';
import 'package:flutter_app/ui/view/user_session.dart';
import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  final UserStore userStore;
  final Widget child;

  const AppProvider({super.key, required this.child, required this.userStore});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserSession(store: userStore)),
      ],
      child: child,
    );
  }
}
