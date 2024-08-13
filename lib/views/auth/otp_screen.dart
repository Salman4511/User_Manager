import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/controllers/auth_controller.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  final TextEditingController _otpController = TextEditingController();

  OtpScreen({super.key, required this.verificationId});

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
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authController.verifyOTP(
                  context: context,
                  verificationId: verificationId,
                  otpSent: _otpController.text,
                );
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
