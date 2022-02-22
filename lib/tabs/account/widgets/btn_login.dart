import 'package:flutter/material.dart';

import 'package:project/tabs/account/functions/helpers_login.dart';

class LoginBtn extends StatefulWidget {
  const LoginBtn({Key? key}) : super(key: key);

  @override
  _LoginBtnState createState() => _LoginBtnState();
}

class _LoginBtnState extends State<LoginBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 50.0,
        child: ElevatedButton(
          child: const Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),
          ),
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            LoginHelpers(context).login();
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
        ),
      ),
    );
  }
}
