import 'package:flutter/material.dart';
import 'package:project/server/server.dart';

import 'package:project/tabs/provider.dart';

import 'package:project/tabs/account/screens/account.dart';
import 'package:project/tabs/account/screens/login.dart';

class AccountSplashScreen extends StatefulWidget {
  final Server _server;

  const AccountSplashScreen(this._server, {Key? key}) : super(key: key);

  @override
  _AccountSplashScreenState createState() => _AccountSplashScreenState();
}

class _AccountSplashScreenState extends State<AccountSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return (GlobalData.currentUser != null)
        ? AccountPage(widget._server)
        : LoginPage(widget._server);
  }
}
