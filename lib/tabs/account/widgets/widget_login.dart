import 'package:flutter/material.dart';
import 'package:project/tabs/account/functions/helpers_input.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          InputHelpers().clearCreateAccountInputs();
          Navigator.of(context).pop();
        },
        child: const Text(
          'Already have an account?',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}