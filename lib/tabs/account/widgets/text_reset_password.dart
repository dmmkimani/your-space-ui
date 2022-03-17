import 'package:flutter/material.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: const Text(
            'Forgot Your Password?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18.0, fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
          child: const Text(
            "Please enter your email address and we'll send you a link to reset your password.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.0, fontWeight: FontWeight.normal
            ),
          ),
        ),
      ],
    );
  }
}