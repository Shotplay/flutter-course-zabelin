import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/states/user_view_model.dart';
import 'package:flutter_app/data/store/user_store.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:flutter_app/router/app_router.dart';
import 'package:flutter_app/ui/theme/app_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => UserStore()),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(store: context.read<UserStore>()),
        ),
      ],
      child: Builder(
        builder: (context) => MaterialApp.router(
          debugShowCheckedModeBanner: true,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          routerConfig: AppRouter(context).router,
        ),
      ),
    );
  }
}
