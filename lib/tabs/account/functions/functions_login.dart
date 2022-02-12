import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/tabs/account/functions/functions_input.dart';
import 'package:project/server/localhost.dart';

class LoginFunctions {
  final BuildContext _context;
  final LocalHost _server = LocalHost();

  LoginFunctions(this._context);

  void createAccount(FirebaseAuth? auth) async {
    Map<String, String> userInputs = InputFunctions().getCreateAccountInputs();

    String fName = userInputs['fName'].toString();
    String lName = userInputs['lName'].toString();
    String email = userInputs['email'].toString();
    String password = userInputs['password'].toString();

    Map<String, dynamic> response =
        await _server.createAccount(fName, lName, email, password);

    switch (response['success']) {
      case true:
        String token = response['token'];
        await auth?.signInWithCustomToken(token);
        return;

      case false:
        String errorMessage = response['message'];
        showErrorMessage(_context, errorMessage);
        return;
    }
  }

  void login(FirebaseAuth? auth) async {
    Map<String, String> userInputs = InputFunctions().getLoginInputs();

    String email = userInputs['email'].toString();
    String password = userInputs['password'].toString();

    Map<String, dynamic> response = await _server.login(email, password);
    switch (response['success']) {
      case true:
        String token = response['token'];
        await auth?.signInWithCustomToken(token);
        return;

      case false:
        String errorMessage = response['message'];
        showErrorMessage(_context, errorMessage);
        return;
    }
  }

  void showErrorMessage(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(content: Text(message)));
  }
}
