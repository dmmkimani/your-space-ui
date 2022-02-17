import 'package:flutter/material.dart';

import 'package:project/tabs/provider.dart';

import 'package:project/tabs/account/functions/functions_input.dart';
import 'package:project/tabs/function_helpers.dart';

class LoginFunctions {
  final BuildContext _context;

  LoginFunctions(this._context);

  void createAccount() async {
    Map<String, String> userInputs = InputFunctions().getCreateAccountInputs();

    String fName = userInputs['fName'].toString();
    String lName = userInputs['lName'].toString();
    String email = userInputs['email'].toString();
    String password = userInputs['password'].toString();

    Map<String, dynamic> response =
        await GlobalData.server.createAccount(fName, lName, email, password);

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
    Map<String, String> userInputs = InputFunctions().getLoginInputs();

    String email = userInputs['email'].toString();
    String password = userInputs['password'].toString();

    Map<String, dynamic> response = await GlobalData.server.login(email, password);
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
    await GlobalData.auth!.signInWithCustomToken(token);
  }
}
