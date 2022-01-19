import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/screens/login/widgets/widget_login_btn.dart';
import 'package:project/screens/login/widgets/widget_password_input.dart';

import 'package:project/screens/login/widgets/widget_create_account.dart';
import 'package:project/screens/login/widgets/widget_forgot_password.dart';
import 'package:project/screens/login/widgets/widget_email_input.dart';
import 'package:project/screens/login/widgets/widget_logo.dart';
import 'package:project/widgets/widget_app_bar.dart';
import 'package:project/widgets/widget_bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static FirebaseAuth? _auth;
  final EmailInputWidget _emailInput = const EmailInputWidget();
  final PasswordInputWidget _passwordInput = const PasswordInputWidget();

  @override
  void initState() {
    super.initState();
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
                  const ForgotPasswordWidget(),
                  LoginBtn(_auth),
                  CreateAccountWidget(_auth),
                ],
              ),
            ),
          ),
          const CustomAppBar('Login')
        ],
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
