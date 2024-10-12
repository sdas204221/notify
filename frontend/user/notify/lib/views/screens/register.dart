import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notify/controllers/providers/register_provider.dart';
import 'package:notify/controllers/user_controller.dart';
import 'package:notify/views/widgets/register/go_to_login_button.dart';
import 'package:notify/views/widgets/register/regester_button.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
      Provider.of<RegesterProvider>(context, listen: false)
          .updateUserName(_userNameController.text);
    });

    _passwordController.addListener(() {
      Provider.of<RegesterProvider>(context, listen: false)
          .updatePassword(_passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (BuildContext context) => RegesterProvider(),
          child: Column(
            children: [
              const Text(
                "Regester",
                style: TextStyle(fontSize: 30),
              ),
              Consumer<RegesterProvider>(
                builder: (BuildContext context, loginProvider, Widget? child) {
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
              Consumer<RegesterProvider>(builder:
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
              Row(
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
              RegisterButton(
                  userName: _userNameController.text,
                  password: _passwordController.text,
                  isRegisterSuccessful: () {
                    return UserController.register(
                        _userNameController.text, _passwordController.text);
                  },
                  context: context),
              GoToLoginButton(
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
