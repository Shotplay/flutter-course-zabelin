import 'package:flutter/material.dart';
import 'package:flutter_app/data/bloc/auth_bloc.dart';
import 'package:flutter_app/data/bloc/user_bloc.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.fromBorderSide(
          BorderSide(width: 1, color: context.brandColors.border),
        ),
      ),
      child: IconButton(
        icon: const Icon(Icons.logout),
        padding: const EdgeInsets.all(0),
        onPressed: () {
          context.read<AuthBloc>().add(const AuthSignOutEvent());
          context.read<UserBloc>().add(const UserResetEvent());
        },
        iconSize: 28,
      ),
    );
  }
}
