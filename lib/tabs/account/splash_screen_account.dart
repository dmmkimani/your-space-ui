import 'package:flutter/material.dart';
import 'package:project/server/server.dart';

import 'package:project/tabs/provider.dart';

import 'package:project/tabs/account/screens/account.dart';
import 'package:project/tabs/account/screens/login.dart';

class AccountSplashScreen extends StatefulWidget {
  final Server _server;
  final UserData _userData;

  const AccountSplashScreen(this._server, this._userData, {Key? key}) : super(key: key);

  @override
  _AccountSplashScreenState createState() => _AccountSplashScreenState();
}

class _AccountSplashScreenState extends State<AccountSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return (widget._userData.user != null)
        ? AccountPage(widget._server, widget._userData)
        : LoginPage(widget._server, widget._userData);
  }
}
