import 'package:flutter/material.dart';

import 'package:project/tabs/account/screens/screen_account.dart';
import 'package:project/tabs/account/widgets/widget_btn_login.dart';
import 'package:project/tabs/account/widgets/widget_input_password.dart';

import 'package:project/tabs/account/widgets/widget_create_account.dart';
import 'package:project/tabs/account/widgets/widget_forgot_password.dart';
import 'package:project/tabs/account/widgets/widget_input_email.dart';
import 'package:project/tabs/account/widgets/widget_logo.dart';
import 'package:project/tabs/widgets/widget_app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with AutomaticKeepAliveClientMixin<LoginPage> {
  final int _selectedPageIndex = 1;
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
              backgroundColor: Colors.white),
        ],
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.blue,
        onTap: (selectedPageIndex) {
          FocusManager.instance.primaryFocus?.unfocus();
          // Go to home page
        },
      ),
    );
  }

  void goToAccountPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AccountPage()));
  }

  @override
  bool get wantKeepAlive => true;
}
