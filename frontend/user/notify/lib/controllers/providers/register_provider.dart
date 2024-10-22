import 'package:flutter/material.dart';

class RegesterProvider extends ChangeNotifier {
  bool hasInvalidCredentials = false;
  String userName = '';
  String password = '';
  String name = '';
  String email = '';
  void invalidateCredentials() {
    hasInvalidCredentials = true;
    notifyListeners();
  }

  void resetCredentialsStatus() {
    hasInvalidCredentials = false;
    notifyListeners();
  }

  void updateUserName(String newUserName) {
    userName = newUserName;
    notifyListeners();
  }

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }
}
