import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/account/functions/helpers_input.dart';
import 'package:project/tabs/account/screens/forgot_password.dart';
import 'package:project/tabs/provider.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final Server _server;
  final UserData _userData;

  const ForgotPasswordWidget(this._server, this._userData, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          InputHelpers().clearInputs();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ForgotPasswordPage(_server, _userData)));
        },
        child: const Text(
          'Forgot your password?',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
