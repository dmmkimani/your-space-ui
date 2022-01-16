import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:project/screens/login/pages/page_create_account.dart';

class CreateAccountWidget extends StatelessWidget {
  final FirebaseAuth? auth;

  const CreateAccountWidget(this.auth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          Navigator.push(
              context, 
              MaterialPageRoute(
                  builder: (context) => CreateAccountPage(auth)
              )
          );
        },
        child: const Text(
          'Create an Account',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}