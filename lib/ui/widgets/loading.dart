import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color(0xFF1F5F5B),
        strokeWidth: 5,
        constraints: BoxConstraints(
          minWidth: 50,
          minHeight: 50,
          maxHeight: 600,
          maxWidth: 600,
        ),
      ),
    );
  }
}
