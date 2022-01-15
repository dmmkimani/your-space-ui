import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/login/widgets/inputs.dart';
import 'package:project/server/localhost.dart';

class LoginFunctions {
  BuildContext context;
  LocalHost server;

  LoginFunctions(this.context, this.server);

  void login(FirebaseAuth? auth, InputsState state) async {
    Map<String,String> userInputs = state.getInputs();

    String email = userInputs['email'].toString();
    String password = userInputs['password'].toString();

    if (email.isNotEmpty && password.isNotEmpty) {
      Map<String,dynamic> response = await server.login(auth, email, password);
      switch(response['success']) {
        case true:
          String token = response['token'];
          await auth?.signInWithCustomToken(token);
          return;

        case false:
          String errorMessage = response['message'];
          userNotFound(context, errorMessage);
          return;
      }
    } else {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
          const SnackBar(
              content: Text('Please enter a username and password')
          )
      );
    }
  }

  void userNotFound(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
        SnackBar(
            content: Text(message)
        )
    );
  }
}