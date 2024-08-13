import 'dart:io';

import 'package:flutter/material.dart';
import 'package:user_manager/models/user_model.dart';

class UserListItem extends StatelessWidget {
  final UserModel user;

  const UserListItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: FileImage(File(user.imageUrl)),
      ),
      title: Text(user.name),
      subtitle: Text('Age: ${user.age}'),
    );
  }
}
