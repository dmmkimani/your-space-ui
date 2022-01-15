import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          // Forgot Password
        },
        child: const Text(
          'Forgot Your Password?',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}