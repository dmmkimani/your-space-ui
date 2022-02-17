import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/tabs/provider.dart';

import 'package:project/tabs/account/widgets/widget_btn_create_account.dart';
import 'package:project/tabs/account/widgets/widget_input_fname.dart';
import 'package:project/tabs/account/widgets/widget_input_lname.dart';

import 'package:project/tabs/account/widgets/widget_login.dart';
import 'package:project/tabs/account/widgets/widget_input_email.dart';
import 'package:project/tabs/account/widgets/widget_input_password.dart';
import 'package:project/tabs/account/widgets/widget_logo.dart';
import 'package:project/tabs/widgets/widget_app_bar.dart';

import 'screen_account.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final EmailInput _emailInput = const EmailInput();
  final PasswordInput _passwordInput = const PasswordInput();
  final FNameInput _fNameInput = const FNameInput();
  final LNameInput _lNameInput = const LNameInput();

  @override
  void initState() {
    GlobalData.auth!.authStateChanges().listen((User? _user) {
      if (_user != null) {
        setState(() {
          goToAccountPage();
        });
      }
    });

    super.initState();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (deviceWidth / 2.0) - 30.0,
                        child: _fNameInput,
                      ),
                      SizedBox(
                        width: (deviceWidth / 2.0) - 30.0,
                        child: _lNameInput,
                      ),
                    ],
                  ),
                  _emailInput,
                  _passwordInput,
                  const CreateAccountBtn(),
                  const LoginWidget(),
                ],
              ),
            ),
          ),
          const DefaultAppBar('Create an Account'),
        ],
      ),
    );
  }

  void goToAccountPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AccountPage()));
  }

  double get deviceWidth {
    return MediaQuery.of(context).size.width;
  }
}
