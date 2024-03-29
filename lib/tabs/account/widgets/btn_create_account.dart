import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/account/functions/helpers_login.dart';
import 'package:project/tabs/provider.dart';

class CreateAccountBtn extends StatefulWidget {
  final Server _server;
  final UserData _userData;

  const CreateAccountBtn(this._server, this._userData, {Key? key})
      : super(key: key);

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
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),
          ),
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            LoginHelpers(widget._server, widget._userData, context)
                .createAccount();
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
