import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/loading.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Loading(child: Text("Пожалуйста, подождите..."))),
    );
  }
}
