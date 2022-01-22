import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/tabs/account/widgets/widget_create_account_btn.dart';

import 'package:project/tabs/account/widgets/widget_login.dart';
import 'package:project/tabs/account/widgets/widget_email_input.dart';
import 'package:project/tabs/account/widgets/widget_password_input.dart';
import 'package:project/tabs/account/widgets/widget_logo.dart';
import 'package:project/widgets/widget_app_bar.dart';
import 'package:project/widgets/widget_bottom_nav_bar.dart';

class CreateAccountPage extends StatefulWidget {
  final FirebaseAuth? _auth;

  const CreateAccountPage(this._auth, {Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late EmailInputWidgetState inputsState;

  final EmailInputWidget _emailInput = const EmailInputWidget();
  final PasswordInputWidget _passwordInput = const PasswordInputWidget();

  @override
  void initState() {
    super.initState();

    widget._auth?.authStateChanges().listen((User? user) {
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
                  _emailInput,
                  _passwordInput,
                  CreateAccountBtn(widget._auth),
                  const LoginWidget(),
                ],
              ),
            ),
          ),
          const DefaultAppBar('Create an Account')
        ],
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
