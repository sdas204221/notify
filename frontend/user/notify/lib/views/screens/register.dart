import 'package:flutter/material.dart';
import 'package:notify/controllers/providers/register_provider.dart';
import 'package:notify/controllers/user_controller.dart';
import 'package:notify/views/widgets/login_register_background.dart';
import 'package:notify/views/widgets/register/go_to_login_button.dart';
import 'package:notify/views/widgets/register/register_button.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isPasswordObscure = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
    _nameController.addListener(() {
      Provider.of<RegesterProvider>(context, listen: false)
          .updateName(_nameController.text);
    });
    _emailController.addListener(() {
      Provider.of<RegesterProvider>(context, listen: false)
          .updateEmail(_emailController.text);
    });
    _passwordController.addListener(() {
      Provider.of<RegesterProvider>(context, listen: false)
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
                EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.07),
            child: Text(
              "Register",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: ChangeNotifierProvider(
                create: (BuildContext context) => RegesterProvider(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.sizeOf(context).height * 0.29, 0, 10),
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: "Name",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          controller: _userNameController,
                          decoration: const InputDecoration(
                            hintText: "Username",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: "Email",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: "Password",
                          ),
                          obscureText: _isPasswordObscure,
                        ),
                      ),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: RegisterButton(
                            isRegisterSuccessful: () {
                              String registrationStatus =
                                  UserController.register(
                                _nameController.text,
                                _emailController.text,
                                _userNameController.text,
                                _passwordController.text,
                              );
                              if (registrationStatus != "Success") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.redAccent,
                                  content: Text(registrationStatus),
                                ));
                              }

                              return registrationStatus == "Success";
                            },
                            context: context),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already regesterd? "),
                            GoToLoginButton(
                              context: context,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
