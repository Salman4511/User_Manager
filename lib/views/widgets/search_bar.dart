import 'package:flutter/material.dart';
import 'package:user_manager/controllers/user_controller.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          labelText: 'Search by name',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          UserController().filterUsers(value);
        },
      ),
    );
  }
}
