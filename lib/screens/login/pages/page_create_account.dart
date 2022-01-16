import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/screens/login/widgets/widget_login.dart';

import 'package:project/server/localhost.dart';

import 'package:project/screens/login/functions/functions_login.dart';

import 'package:project/screens/login/widgets/widget_inputs.dart';
import 'package:project/screens/login/widgets/widget_logo.dart';
import 'package:project/widgets/widget_bottom_nav_bar.dart';

class CreateAccountPage extends StatefulWidget {
  final FirebaseAuth? auth;

  const CreateAccountPage(this.auth, {Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final LocalHost _server = LocalHost();
  late InputsWidgetState inputsState;

  final InputsWidget inputs = const InputsWidget();

  @override
  void initState() {
    super.initState();
    inputsState = inputs.createState();

    widget.auth?.authStateChanges().listen((User? user) {
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
          'Create an Account',
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
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 18.0),
                        ),
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          LoginFunctions(context, _server)
                              .createAccount(widget.auth, inputsState);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                      ),
                    ),
                  ),
                  const LoginWidget(),
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
