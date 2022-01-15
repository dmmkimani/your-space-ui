import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:project/screens/login/widgets/forgot_password.dart';
import 'package:project/screens/login/widgets/inputs.dart';
import 'package:project/screens/login/widgets/logo.dart';

import 'package:project/server/localhost.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalHost server = LocalHost();
  static FirebaseAuth? auth;
  User? user;
  final Inputs inputs = const Inputs();
  late InputsState inputsState;

  @override
  void initState() {
    super.initState();
    inputsState = inputs.createState();

    Firebase.initializeApp().whenComplete(() {
      auth = FirebaseAuth.instance;
      user = auth?.currentUser;
      if (user != null) {
        // Go To Next Page
      }
    });
  }

  Widget appBar = Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const Border(
            bottom: BorderSide(color: Colors.grey, width: 0.2)),
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Logo(),
                  inputs,
                  const ForgotPassword(),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          child: const Text('Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18.0)),
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            login();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
          appBar
        ],
      )
    );
  }

  void login() async {
    Map<String,String> userInputs = inputsState.getInputs();

    String userEmail = userInputs['email'].toString();
    String userPassword = userInputs['password'].toString();

    auth?.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          // User is logged in
        });
      } else {
        setState(() {
          // User is not logged in
        });
      }
    });

    if (filledIn(context, userEmail, userPassword)) {
      Map<String, String> body = {'email': userEmail, 'password': userPassword};
      final credentials = json.encode(body);

      Response response =
          await post(Uri.parse(server.localhost() + "/login"), body: credentials);

      switch(response.statusCode) {
        case 200:
          String token = response.body.toString();
          await auth?.signInWithCustomToken(token);
          break;

        case 404:
          String errorMessage = response.body.toString();
          userNotFound(context, errorMessage);
          return;
      }
    }
  }

  bool filledIn(BuildContext context, String username, String password) {
    if (username.isNotEmpty && password.isNotEmpty) {
      return true;
    }

    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
        const SnackBar(
            content: Text('Please enter a username and password')
        )
    );

    return false;
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
