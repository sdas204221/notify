import 'package:flutter/foundation.dart';

class UserController {
  static bool login(String userName, String password) {
    // TODO: implement login logic
    if (kDebugMode) {
      print(userName);
      print(password);
    }
    return userName == password;
  }

  static String register(
    String name,
    String email,
    String userName,
    String password,
  ) {
    // TODO: implement login logic
    if (kDebugMode) {
      print(userName);
      print(password);
    }
    if (userName == password) {
      return "Success";
    } else {
      return "Somthing went wrong";
    }
  }
}
