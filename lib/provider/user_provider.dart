// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:users_app/api/api.dart';
import 'package:users_app/models/users.dart';

class UserProvider extends ChangeNotifier {
  List<Users> users = [];
  bool isLoading = false;
  String? errorMessage;

  Api _api = Api();

  Future<void> fetchUsers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners(); //for data update

    try {
      users = await _api.getUsers();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
