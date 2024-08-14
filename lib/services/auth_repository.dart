// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:user_manager/views/auth/login_screen.dart';
import '../views/auth/otp_screen.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginWithPhoneNumber(
      String phoneNumber, BuildContext context) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber);
    String parsableNumber = number.parseNumber();

    await _auth.verifyPhoneNumber(
      phoneNumber: parsableNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          _showCustomSnackbar(
              context, 'The provided phone number is not valid');
        } else {
          _showCustomSnackbar(context, 'Something went wrong, try again!');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String otpSent,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpSent,
      );
      await _auth.signInWithCredential(credential).then((UserCredential user) {
        if (user.user != null) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      _showCustomSnackbar(context, e.message.toString());
    }
  }

  void logout(BuildContext context) async {
    await _auth.signOut().then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    });
  }

  void _showCustomSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
