import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/controllers/user_controller.dart';
import 'package:user_manager/utils/constants.dart';
import 'package:user_manager/utils/debouncer.dart';

class TopBarWidget extends StatelessWidget {
  TopBarWidget({super.key});

  final TextEditingController _searchController = TextEditingController();

  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context, listen: false);

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search by name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) {
              _debouncer.run(() {
                userController.filterUsers(value);
              });
            },
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: const Icon(Icons.sort, color: Constants.kwhite),
            onPressed: () {
              _showSortOptions(context, userController);
            },
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  void _showSortOptions(BuildContext context, UserController userController) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Sort', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ListTile(
                leading: Radio(
                  value: 'All',
                  groupValue: 'sort',
                  onChanged: (value) {
                    Navigator.pop(context);
                    userController.fetchUsers();
                  },
                ),
                title: const Text('All'),
              ),
              ListTile(
                leading: Radio(
                  value: 'Elder',
                  groupValue: 'sort',
                  onChanged: (value) {
                    Navigator.pop(context);
                    userController.sortUsersByAgeOlder();
                  },
                ),
                title: const Text('Age: Elder'),
              ),
              ListTile(
                leading: Radio(
                  value: 'Younger',
                  groupValue: 'sort',
                  onChanged: (value) {
                    Navigator.pop(context);
                    userController.sortUsersByAgeYounger();
                  },
                ),
                title: const Text('Age: Younger'),
              ),
            ],
          ),
        );
      },
    );
  }
}
