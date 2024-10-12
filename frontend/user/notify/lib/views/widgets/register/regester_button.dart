import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/controllers/providers/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterButton extends StatelessWidget {
  final String userName;
  final String password;
  final BuildContext context;
  final bool Function() isRegisterSuccessful;

  const RegisterButton({
    super.key,
    required this.userName,
    required this.password,
    required this.context,
    required this.isRegisterSuccessful,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (!isRegisterSuccessful()) {
          // If login fails, set the invalid credentials flag
          Provider.of<RegesterProvider>(context, listen: false)
              .invalidateCredentials();
          if (kDebugMode) {
            print("fail");
          }
        } else {
          // If login succeeds, reset the invalid credentials flag
          Provider.of<RegesterProvider>(context, listen: false)
              .resetCredentialsStatus();
          if (kDebugMode) {
            print("pass");
            context.replace("/login");
          }
          // Proceed with further actions such as navigation
        }
      },
      child: const Text("Register"),
    );
  }
}
