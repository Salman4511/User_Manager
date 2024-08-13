import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Enter Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authController.loginWithPhoneNumber(
                    _phoneController.text, context);
              },
              child: const Text('Get OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
