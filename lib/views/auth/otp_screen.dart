import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/controllers/auth_controller.dart';
import 'package:user_manager/controllers/timer_controller.dart';
import 'package:user_manager/utils/constants.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;

  OtpScreen({super.key, required this.verificationId});

  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: false);
    final timerProvider = Provider.of<TimerProvider>(context);

    if (!timerProvider.isRunning) {
      timerProvider.startTimer();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Constants.kheight100,
              Image.asset(
                'assets/images/image2.png',
                scale: 1.5,
              ),
              Constants.kheight20,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "OTP verification",
                  style: Constants.ktextStyle1,
                ),
              ),
              Constants.kheight20,
              const Text(
                "Enter the verification code we just send to your number +91*****21",
                textAlign: TextAlign.left,
                style: Constants.ktextStyle3,
              ),
              Constants.kheight20,
              Pinput(
                defaultPinTheme: PinTheme(
                    width: 55,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Constants.kgrey),
                      borderRadius: BorderRadius.circular(10),
                    )),
                focusedPinTheme: PinTheme(
                    width: 55,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Constants.kblack),
                      borderRadius: BorderRadius.circular(10),
                    )),
                length: 6,
                controller: _otpController,
                onChanged: (value) {},
              ),
              Constants.kheight20,
              Text(timerProvider.formattedTime,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Constants.kred)),
              Constants.kheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t Get OTP?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Resend',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Constants.kheight20,
              SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    authController.verifyOTP(
                      context: context,
                      verificationId: verificationId,
                      otpSent: _otpController.text,
                    );
                  },
                  style: Constants.kbuttonStyle1,
                  child: const Text("Verify"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
