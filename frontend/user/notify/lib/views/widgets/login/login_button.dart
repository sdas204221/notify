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
    return MaterialButton(
      onPressed: () {
        if (!isLoginSuccessful()) {
          // If login fails, set the invalid credentials flag
          Provider.of<LoginProvider>(context, listen: false)
              .invalidateCredentials();
          if (kDebugMode) {
            print("fail");
          }
        } else {
          // If login succeeds, reset the invalid credentials flag
          Provider.of<LoginProvider>(context, listen: false)
              .resetCredentialsStatus();
          if (kDebugMode) {
            print("pass");
            context.go("/home");
          }
          // Proceed with further actions such as navigation
        }
      },
      child: const Text("Login"),
    );
  }
}
