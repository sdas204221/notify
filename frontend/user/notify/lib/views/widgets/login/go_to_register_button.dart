import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoToRegisterButton extends MaterialButton {
  final BuildContext context;

  GoToRegisterButton({
    super.key,
    required this.context,
  }) : super(
            onPressed: () {
              context.go("/register");
            },
            child: const Text("Register"));
}
