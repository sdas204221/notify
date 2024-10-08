import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoToLoginButton extends MaterialButton {
  final BuildContext context;

  GoToLoginButton({
    super.key,
    required this.context,
  }) : super(
            onPressed: () {
              context.go("/login");
            },
            child: const Text("Login"));
}
