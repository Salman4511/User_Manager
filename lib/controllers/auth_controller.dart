import 'package:flutter/material.dart';
import 'package:user_manager/services/auth_repository.dart';

class AuthController with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  void loginWithPhoneNumber(String phoneNumber, BuildContext context) {
    _authRepository.loginWithPhoneNumber(phoneNumber, context);
  }

  void verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String otpSent}) {
    _authRepository.verifyOTP(
        context: context, verificationId: verificationId, otpSent: otpSent);
  }
}
