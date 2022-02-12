import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:project/tabs/account/functions/functions_input.dart';
import 'package:project/tabs/account/screens/screen_create_account.dart';

class CreateAccountWidget extends StatelessWidget {
  final FirebaseAuth? _auth;

  const CreateAccountWidget(this._auth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          InputFunctions().clearInputs();
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => CreateAccountPage(_auth)
              )
          );
        },
        child: const Text(
          'Create an account',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}