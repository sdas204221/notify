import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoToLoginButton extends StatelessWidget {
  final BuildContext context;

  const GoToLoginButton({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go("/login");
      },
      child: const Text("Login here"),
    );
  }
}
