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

  static bool register(String userName, String password) {
    // TODO: implement login logic
    if (kDebugMode) {
      print(userName);
      print(password);
    }
    return userName == password;
  }
}
