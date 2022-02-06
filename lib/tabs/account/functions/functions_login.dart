import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/tabs/account/functions/functions_input.dart';
import 'package:project/server/localhost.dart';

class LoginFunctions {
  BuildContext context;
  LocalHost server = LocalHost();

  LoginFunctions(this.context);

  void login(FirebaseAuth? auth) async {
    Map<String,String> userInputs = InputFunctions().getInputs();

    String email = userInputs['email'].toString();
    String password = userInputs['password'].toString();

    if (email.isNotEmpty && password.isNotEmpty) {
      Map<String,dynamic> response = await server.login(email, password);
      switch(response['success']) {
        case true:
          String token = response['token'];
          await auth?.signInWithCustomToken(token);
          return;

        case false:
          String errorMessage = response['message'];
          showErrorMessage(context, errorMessage);
          return;
      }
    } else {
      noInput(context);
    }
  }

  void createAccount(FirebaseAuth? auth) async {
    Map<String,String> userInputs = InputFunctions().getInputs();

    String email = userInputs['email'].toString();
    String password = userInputs['password'].toString();

    if (email.isNotEmpty && password.isNotEmpty) {
      Map<String,dynamic> response = await server.createAccount(email, password);
      switch(response['success']) {
        case true:
          String token = response['token'];
          await auth?.signInWithCustomToken(token);
          return;

        case false:
          String errorMessage = response['message'];
          showErrorMessage(context, errorMessage);
          return;
      }
    } else {
      noInput(context);
    }
  }

  void noInput(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
        const SnackBar(
            content: Text('Please enter a username and a password')
        )
    );
  }

  void showErrorMessage(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
        SnackBar(
            content: Text(message)
        )
    );
  }
}