import 'package:flutter/material.dart';
import 'package:user_manager/models/user_model.dart';
import 'package:user_manager/services/user_service.dart';

class UserController with ChangeNotifier {
  List<UserModel> _userList = [];

  List<UserModel> get userList => _userList;

  void fetchUsers() async {
    _userList = await UserService().getUsers();
    notifyListeners();
  }

  void addUser(UserModel user) async {
    await UserService().addUser(user);
    fetchUsers();
  }

  void filterUsers(String query) {
    _userList = _userList.where((user) {
      return user.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }
}
