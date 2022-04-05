import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/tabs/account/screens/account.dart';
import 'package:project/tabs/provider.dart';
import 'package:project/tabs/account/functions/helpers_input.dart';
import 'package:project/tabs/helpers.dart';

class LoginHelpers {
  final Server _server;
  final UserData _userData;
  final BuildContext _context;

  LoginHelpers(this._server, this._userData, this._context);

  void createAccount() async {
    Map<String, String> userInputs = InputHelpers().getCreateAccountInputs();

    Map<String, dynamic> response = await _server.createAccount({
      'fName': userInputs['fName'].toString(),
      'lName': userInputs['lName'].toString(),
      'email': userInputs['email'].toString(),
      'password': userInputs['password'].toString()
    });

    switch (response['success']) {
      case true:
        String token = response['token'];
        signIn(token, false);
        return;

      case false:
        String errorMessage = response['message'];
        HelperFunctions().showSnackBar(_context, errorMessage);
        return;
    }
  }

  void login() async {
    Map<String, String> userInputs = InputHelpers().getLoginInputs();

    Map<String, dynamic> response = await _server.login({
      'email': userInputs['email'].toString(),
      'password': userInputs['password'].toString()
    });

    switch (response['success']) {
      case true:
        String token = response['token'];
        signIn(token, true);
        return;

      case false:
        String errorMessage = response['message'];
        HelperFunctions().showSnackBar(_context, errorMessage);
        return;
    }
  }

  void signIn(String token, bool login) async {
    _userData.auth.authStateChanges().listen((User? user) {
      _userData.auth.signInWithCustomToken(token);
      _userData.user = user!;
      Navigator.of(_context).pushReplacement(MaterialPageRoute(
          builder: (context) => AccountPage(_server, _userData)));
    });
    if (login) {
      InputHelpers().clearInputs();
    } else {
      InputHelpers().clearCreateAccountInputs();
    }
  }
}
