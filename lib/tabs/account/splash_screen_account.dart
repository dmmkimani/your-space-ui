import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/tabs/provider.dart';

import 'package:project/tabs/account/screens/account.dart';
import 'package:project/tabs/account/screens/login.dart';

class AccountSplashScreen extends StatefulWidget {
  const AccountSplashScreen({Key? key}) : super(key: key);

  @override
  _AccountSplashScreenState createState() => _AccountSplashScreenState();
}

class _AccountSplashScreenState extends State<AccountSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return (GlobalData.currentUser != null)
          ? const AccountPage()
          : const LoginPage();
  }
}