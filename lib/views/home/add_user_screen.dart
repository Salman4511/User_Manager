import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/controllers/user_controller.dart';
import 'package:user_manager/models/user_model.dart';

class AddUserScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final user = UserModel(
                  name: _nameController.text,
                  age: int.parse(_ageController.text),
                  imageUrl: '',
                );
                userController.addUser(user);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
