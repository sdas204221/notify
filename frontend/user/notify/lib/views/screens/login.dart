import 'package:flutter/material.dart';
import 'package:notify/controllers/providers/login_provider.dart';
import 'package:notify/controllers/user_controller.dart';
import 'package:notify/views/widgets/login/login_button.dart';
import 'package:notify/views/widgets/login/go_to_register_button.dart';
import 'package:notify/views/widgets/login_register_background.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordObscure = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  @override
  void dispose() {
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _userNameController.addListener(() {
      Provider.of<LoginProvider>(context, listen: false)
          .updateUserName(_userNameController.text);
    });

    _passwordController.addListener(() {
      Provider.of<LoginProvider>(context, listen: false)
          .updatePassword(_passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          const LoginRegisterBackground(),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).width * 0.15),
            child: Text(
              "Login",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).width * 0.8),
                    child: Consumer<LoginProvider>(
                      builder:
                          (BuildContext context, loginProvider, Widget? child) {
                        return TextField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                            hintText: "User name or email",
                            errorText: loginProvider.hasInvalidCredentials
                                ? "Invalid credentials"
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Consumer<LoginProvider>(builder:
                        (BuildContext context, loginProvider, Widget? child) {
                      return TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",

                          errorText: loginProvider.hasInvalidCredentials
                              ? "Invalid credentials"
                              : null, // Show error text if credentials are invalid
                        ),
                        obscureText: _isPasswordObscure,
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Checkbox(
                            value: !_isPasswordObscure,
                            onChanged: (newValue) {
                              setState(() {
                                _isPasswordObscure = !(newValue ?? false);
                              });
                            }),
                        const Text("Show password")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: LoginButton(
                        userName: _userNameController.text,
                        password: _passwordController.text,
                        isLoginSuccessful: () {
                          return UserController.login(_userNameController.text,
                              _passwordController.text);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("New User? "),
                        GoToRegisterButton(context: context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
