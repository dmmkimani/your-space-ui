import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/tabs/provider.dart';

import 'package:project/tabs/account/functions/helpers_input.dart';
import 'package:project/tabs/function_helpers.dart';

import '../splash_screen_account.dart';

class LoginHelpers {
  final BuildContext _context;

  LoginHelpers(this._context);

  void createAccount() async {
    Map<String, String> userInputs = InputHelpers().getCreateAccountInputs();

    Map<String, dynamic> response = await GlobalData.server.createAccount({
      'fName': userInputs['fName'].toString(),
      'lName': userInputs['lName'].toString(),
      'email': userInputs['email'].toString(),
      'password': userInputs['password'].toString()
    });

    switch (response['success']) {
      case true:
        String token = response['token'];
        signIn(token);
        return;

      case false:
        String errorMessage = response['message'];
        HelperFunctions().showSnackBar(_context, errorMessage);
        return;
    }
  }

  void login() async {
    Map<String, String> userInputs = InputHelpers().getLoginInputs();

    Map<String, dynamic> response = await GlobalData.server.login({
      'email': userInputs['email'].toString(),
      'password': userInputs['password'].toString()
    });
    switch (response['success']) {
      case true:
        String token = response['token'];
        signIn(token);
        return;

      case false:
        String errorMessage = response['message'];
        HelperFunctions().showSnackBar(_context, errorMessage);
        return;
    }
  }

  void signIn(String token) async {
    GlobalData.auth!.authStateChanges().listen((User? user) {
      GlobalData.currentUser == user!;
      Navigator.of(_context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AccountSplashScreen()));
    });
    GlobalData.auth!.signInWithCustomToken(token);
  }
}
