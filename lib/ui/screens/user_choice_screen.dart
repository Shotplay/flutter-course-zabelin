import 'package:flutter/material.dart';
import 'package:flutter_app/data/user_session.dart';
import 'package:provider/provider.dart';

class UserChoiceScreen extends StatefulWidget {
  const UserChoiceScreen({super.key});

  @override
  State<UserChoiceScreen> createState() => _UserChoiceScreenState();
}

class _UserChoiceScreenState extends State<UserChoiceScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 100, minHeight: 100),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 5,
                children: [
                  TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF1F5F5B)),
                      ),
                      labelText: "Ваш User ID",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500),
                      floatingLabelStyle: TextStyle(
                        color: Color(0xFF1F5F5B),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UserSession>().load(_textController.text);
                      _textController.clear();
                    },
                    child: const Text(
                      "Войти",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
