import 'package:flutter/material.dart';
import 'package:holistic_2_wheather_app/Models/User.dart';
import 'package:holistic_2_wheather_app/Services/UserServices.dart';

class UserProvider extends ChangeNotifier {
  User? user;
  Future<void> login({required String email, required String password}) async {
    user = await UserService.login(email: email, password: password);
    notifyListeners();
  }

  Future<void> signup({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    user = await UserService.signup(
      name: name,
      phone: phone,
      email: email,
      password: password,
    );
    notifyListeners();
  }
}
