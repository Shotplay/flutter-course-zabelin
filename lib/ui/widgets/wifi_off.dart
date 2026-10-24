import 'package:flutter/material.dart';
import 'package:flutter_app/utils/theme.dart';

class WifiOff extends StatelessWidget {
  final VoidCallback onRefresh;

  const WifiOff({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ).copyWith(bottom: 60),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _Icon(),
              const _Heading(),
              const _Body(),
              _RefreshButton(onRefresh: onRefresh),
            ],
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 44,
      backgroundColor: context.theme.colorScheme.errorContainer,
      child: Icon(
        Icons.wifi_off,
        size: 36,
        color: context.theme.colorScheme.error,
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Не удалось загрузить данные",
      textAlign: TextAlign.center,
      style: context.theme.textTheme.headlineMedium,
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Проверьте подключение к интернету и попробуйте еще раз",
      textAlign: TextAlign.center,
      style: context.theme.textTheme.bodyLarge,
    );
  }
}

class _RefreshButton extends StatelessWidget {
  final VoidCallback onRefresh;

  const _RefreshButton({required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 200),
      child: FilledButton(onPressed: onRefresh, child: const Text("Обновить")),
    );
  }
}
