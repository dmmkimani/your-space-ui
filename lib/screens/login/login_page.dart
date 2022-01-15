import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:project/screens/login/functions/functions.dart';
import 'package:project/screens/login/widgets/create_an_account.dart';
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
      } else {
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
                            LoginFunctions(context, server).login(auth, inputsState);
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
                  ),
                  const CreateAnAccount()
                ],
              ),
            ),
          ),
          appBar
        ],
      )
    );
  }
}
