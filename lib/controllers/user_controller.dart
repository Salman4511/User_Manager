import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_manager/models/user_model.dart';
import 'package:user_manager/services/user_service.dart';

class UserController with ChangeNotifier {
  List<UserModel> _userList = [];
  File? image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

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

  void sortUsersByAgeOlder() {
    _userList.sort((a, b) {
      if (a.age > 60 && b.age <= 60) return -1;
      if (a.age <= 60 && b.age > 60) return 1;
      return b.age.compareTo(a.age);
    });
    notifyListeners();
  }

  void sortUsersByAgeYounger() {
    _userList.sort((a, b) {
      if (a.age <= 60 && b.age > 60) return -1;
      if (a.age > 60 && b.age <= 60) return 1;
      return a.age.compareTo(b.age);
    });
    notifyListeners();
  }

  Future<void> pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      notifyListeners();
    }
  }

  void clearImage() {
    image = null;
    notifyListeners();
  }

  void clearControllers() {
    nameController.clear();
    ageController.clear();
  }
}
