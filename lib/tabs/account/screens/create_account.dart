import 'package:flutter/material.dart';

import 'package:project/tabs/account/widgets/btn_create_account.dart';
import 'package:project/tabs/account/widgets/textfield_fname.dart';
import 'package:project/tabs/account/widgets/textfield_lname.dart';

import 'package:project/tabs/account/widgets/text_login.dart';
import 'package:project/tabs/account/widgets/textfield_email.dart';
import 'package:project/tabs/account/widgets/textfield_password.dart';
import 'package:project/tabs/account/widgets/logo.dart';
import 'package:project/tabs/widgets/app_bar.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

import 'account.dart';

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
      bottomNavigationBar: BottomNavBar(1),
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
