import 'package:flutter/material.dart';

class RegesterProvider extends ChangeNotifier {
  bool hasInvalidCredentials = false;
  String userName = '';
  String password = '';
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

  void updatePassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }
}
