import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:project/server/localhost.dart';

import 'package:project/screens/login/functions/functions_login.dart';

import 'package:project/screens/login/widgets/widget_create_account.dart';
import 'package:project/screens/login/widgets/widget_forgot_password.dart';
import 'package:project/screens/login/widgets/widget_inputs.dart';
import 'package:project/screens/login/widgets/widget_logo.dart';
import 'package:project/widgets/widget_bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalHost _server = LocalHost();
  static FirebaseAuth? _auth;
  late InputsWidgetState inputsState;

  final InputsWidget inputs = const InputsWidget();

  @override
  void initState() {
    super.initState();
    inputsState = inputs.createState();

    Firebase.initializeApp().whenComplete(() {
      _auth = FirebaseAuth.instance;
    });
    User? _user = _auth?.currentUser;
    if (_user != null) {
      // Go To Next Page
    } else {
      _auth?.authStateChanges().listen((User? user) {
        if (user != null) {
        } else {}
      });
    }
  }

  Widget appBar = Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LogoWidget(),
                  inputs,
                  const ForgotPasswordWidget(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 18.0),
                        ),
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          LoginFunctions(context, _server)
                              .login(_auth, inputsState);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                      ),
                    ),
                  ),
                  CreateAccountWidget(_auth),
                ],
              ),
            ),
          ),
          appBar
        ],
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
