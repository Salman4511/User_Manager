import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/controllers/user_controller.dart';
import 'package:user_manager/views/home/add_user_screen.dart';
import 'package:user_manager/views/widgets/user_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context, listen: false);
    userController.fetchUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: Consumer<UserController>(
        builder: (context, controller, child) {
          return controller.userList.isEmpty
              ? const Center(child: Text('No users found'))
              : ListView.builder(
                  itemCount: controller.userList.length,
                  itemBuilder: (context, index) {
                    return UserListItem(user: controller.userList[index]);
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return AddUserScreen();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
