import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/controllers/auth_controller.dart';
import 'package:user_manager/utils/constants.dart';

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
          children: [
            Constants.kheight100,
            Image.asset(
              'assets/images/image1.png',
              scale: 1.5,
            ),
            Constants.kheight50,
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter Phone Number",
                style: Constants.ktextStyle1,
              ),
            ),
            Constants.kheight20,
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Enter Phone Number",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              keyboardType: TextInputType.phone,
            ),
            Constants.kheight20,
            Stack(children: [
              Row(
                children: [
                  const Text(
                    "By continuing, I agree to TotalX's",
                    textAlign: TextAlign.left,
                    style: Constants.ktextStyle2,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/terms');
                      },
                      child: const Text(
                        "Terms & Condition",
                        style: TextStyle(
                          color: Constants.kblue,
                        ),
                      )),
                  const Text(
                    "&",
                    textAlign: TextAlign.left,
                    style: Constants.ktextStyle2,
                  ),
                ],
              ),
              Positioned(
                top: 20,
                left: -8,
                child: SizedBox(
                  height: 40,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Privacy Policy",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Constants.kblue,
                        ),
                      )),
                ),
              ),
            ]),
            Constants.kheight20,
            SizedBox(
              width: 400,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  authController.loginWithPhoneNumber(
                      _phoneController.text, context);
                },
                style: Constants.kbuttonStyle1,
                child: const Text("Get OTP"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
