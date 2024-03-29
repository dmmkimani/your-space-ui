import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/account/functions/helpers_input.dart';
import 'package:project/tabs/account/screens/create_account.dart';
import 'package:project/tabs/provider.dart';

class CreateAccountWidget extends StatelessWidget {
  final Server _server;
  final UserData _userData;

  const CreateAccountWidget(this._server, this._userData, {Key? key})
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateAccountPage(_server, _userData)));
        },
        child: const Text(
          'Create an account',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
