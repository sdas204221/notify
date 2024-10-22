import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoToRegisterButton extends StatelessWidget {
  final BuildContext context;

  const GoToRegisterButton({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go("/register");
      },
      child: const Text("Register here"),
    );
  }
}
