import 'package:flutter/material.dart';
import 'package:flutter_app/data/bloc/auth_bloc.dart';
import 'package:flutter_app/domain/validators/email_validator.dart';
import 'package:flutter_app/domain/validators/password_validator.dart';
import 'package:flutter_app/router/app_router.dart';
import 'package:flutter_app/ui/widgets/error_banner.dart';
import 'package:flutter_app/ui/widgets/form_input.dart';
import 'package:flutter_app/ui/widgets/logo.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hasError = false;

  void _setHasError(bool has) {
    _hasError = has;
    setState(() {});
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
                if (_hasError)
                  const ErrorBanner(text: "Не удалось создать аккаунт"),
                _Form(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                _RegisterButton(
                  formKey: _formKey,
                  setHasError: _setHasError,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const _ToLoginButton(),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text("Регистрация", style: context.theme.textTheme.headlineMedium),
        Text(
          "Создайте аккаунт — избранное будет сохраняться за вами",
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
            validator: validatePassword,
          ),
        ],
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueChanged<bool> setHasError;

  const _RegisterButton({
    required this.formKey,
    required this.setHasError,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      child: const Text("Зарегистрироваться"),
      onPressed: () async {
        if (!formKey.currentState!.validate()) {
          setHasError(true);
          return;
        }

        setHasError(false);
        final authBloc = context.read<AuthBloc>();
        authBloc.add(
          AuthSignUpEvent(emailController.text, passwordController.text),
        );

        emailController.clear();
        passwordController.clear();
      },
    );
  }
}

class _ToLoginButton extends StatelessWidget {
  const _ToLoginButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(
        builder: (context) => TextButton(
          onPressed: () => LoginRoute().go(context),
          child: Text("Уже есть аккаунт? Войти"),
        ),
      ),
    );
  }
}
