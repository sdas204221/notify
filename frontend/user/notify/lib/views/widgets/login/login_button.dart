import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/controllers/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  final String userName;
  final String password;
  final bool Function() isLoginSuccessful;

  const LoginButton({
    super.key,
    required this.userName,
    required this.password,
    required this.isLoginSuccessful,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isLoginSuccessful()) {
          Provider.of<LoginProvider>(context, listen: false)
              .invalidateCredentials();
          if (kDebugMode) {
            print("fail");
          }
        } else {
          Provider.of<LoginProvider>(context, listen: false)
              .resetCredentialsStatus();
          if (kDebugMode) {
            print("pass");
          }
          context.go("/home");
        }
      },
      child: const Text("Login"),
    );
  }
}
