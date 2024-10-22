import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterButton extends StatelessWidget {
  final BuildContext context;
  final bool Function() isRegisterSuccessful;

  const RegisterButton({
    super.key,
    required this.context,
    required this.isRegisterSuccessful,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isRegisterSuccessful()) {
          // Provider.of<RegesterProvider>(context, listen: false)
          //     .invalidateCredentials();
          if (kDebugMode) {
            print("fail");
          }
        } else {
          // Provider.of<RegesterProvider>(context, listen: false)
          //     .resetCredentialsStatus();
          if (kDebugMode) {
            print("pass");
          }
          context.go("/login");
        }
      },
      child: const Text("Register"),
    );
  }
}
