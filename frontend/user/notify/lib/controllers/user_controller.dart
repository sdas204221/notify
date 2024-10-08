import 'package:flutter/foundation.dart';

bool login(String userName, String password) {
  // TODO: implement login logic
  if (kDebugMode) {
    print(userName);
    print(password);
  }
  return userName == password;
}

bool register(String userName, String password) {
  // TODO: implement login logic
  if (kDebugMode) {
    print(userName);
    print(password);
  }
  return userName == password;
}
