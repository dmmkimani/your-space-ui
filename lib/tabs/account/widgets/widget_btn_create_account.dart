import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:project/tabs/account/functions/functions_login.dart';

class CreateAccountBtn extends StatefulWidget {
  final FirebaseAuth? _auth;

  const CreateAccountBtn(this._auth, {Key? key}) : super(key: key);

  @override
  _CreateAccountBtnState createState() => _CreateAccountBtnState();
}

class _CreateAccountBtnState extends State<CreateAccountBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 50.0,
        child: ElevatedButton(
          child: const Text(
            'Create Account',
            style: TextStyle(
                fontWeight: FontWeight.normal, fontSize: 18.0),
          ),
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            LoginFunctions(context)
                .createAccount(widget._auth);
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
        ),
      ),
    );
  }
}