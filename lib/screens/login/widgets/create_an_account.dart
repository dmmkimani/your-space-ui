import 'package:flutter/material.dart';

class CreateAnAccount extends StatelessWidget {
  const CreateAnAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          // Create an Account
        },
        child: const Text(
          'Create an Account',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}