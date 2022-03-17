import 'package:flutter/material.dart';

import 'package:project/tabs/account/screens/account.dart';
import 'package:project/tabs/account/widgets/btn_login.dart';
import 'package:project/tabs/account/widgets/textfield_password.dart';

import 'package:project/tabs/account/widgets/text_create_account.dart';
import 'package:project/tabs/account/widgets/text_forgot_password.dart';
import 'package:project/tabs/account/widgets/textfield_email.dart';
import 'package:project/tabs/account/widgets/logo.dart';
import 'package:project/tabs/widgets/app_bar.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with AutomaticKeepAliveClientMixin<LoginPage> {
  final EmailInput _emailInput = const EmailInput();
  final PasswordInput _passwordInput = const PasswordInput();

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                  const LoginBtn(),
                  const CreateAccountWidget(),
                ],
              ),
            ),
          ),
          const DefaultAppBar('Login')
        ],
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }

  void goToAccountPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AccountPage()));
  }

  @override
  bool get wantKeepAlive => true;
}
