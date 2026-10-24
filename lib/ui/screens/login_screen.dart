import 'package:flutter/material.dart';
import 'package:flutter_app/data/states/user_view_model.dart';
import 'package:flutter_app/domain/validators/email_validator.dart';
import 'package:flutter_app/router/app_router.dart';
import 'package:flutter_app/ui/widgets/form_input.dart';
import 'package:flutter_app/ui/widgets/logo.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 96,
              right: 32,
              bottom: 40,
              left: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 24,
              children: [
                const Logo(),
                const _Heading(),
                _Form(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                _LoginButton(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const _ToRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Вход", style: context.theme.textTheme.headlineMedium),
        Text(
          "Войдите, чтобы увидеть каталог и свое избранное",
          style: context.theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _Form extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _Form({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 16,
        children: [
          FormInput(
            title: "Email",
            controller: emailController,
            validator: validateEmail,
          ),
          FormInput(
            title: "Пароль",
            controller: passwordController,
            obsecureText: true,
          ),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _LoginButton({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      child: const Text("Войти"),
      onPressed: () async {
        if (!formKey.currentState!.validate()) return;

        final user = context.read<UserViewModel>();
        final success = await user.login(
          emailController.text,
          passwordController.text,
        );

        if (!context.mounted) return;

        if (success) return CatalogRoute().go(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              "Произошла ошибка входа, проверьте подключение к интернету, корректность введенных данных или попробуйте позже",
            ),
          ),
        );
      },
    );
  }
}

class _ToRegisterButton extends StatelessWidget {
  const _ToRegisterButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(
        builder: (context) => TextButton(
          onPressed: () => RegisterRoute().go(context),
          child: const Text("Нет аккаунта? Зарегистрироваться"),
        ),
      ),
    );
  }
}
