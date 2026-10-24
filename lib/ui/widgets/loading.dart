import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Widget? child;

  const Loading({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          const CircularProgressIndicator(
            color: Color(0xFF1F5F5B),
            strokeWidth: 5,
            constraints: BoxConstraints(minWidth: 70, minHeight: 70),
          ),
          ?child,
        ],
      ),
    );
  }
}
