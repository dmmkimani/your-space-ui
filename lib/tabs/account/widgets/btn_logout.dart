import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/account/splash_screen_account.dart';
import 'package:project/tabs/provider.dart';

class LogoutBtn extends StatefulWidget {
  final Server _server;
  final UserData _userData;

  const LogoutBtn(this._server, this._userData, {Key? key}) : super(key: key);

  @override
  _LogoutBtnState createState() => _LogoutBtnState();
}

class _LogoutBtnState extends State<LogoutBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          widget._userData.auth.signOut().whenComplete(() {
            widget._userData.user = null;
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    AccountSplashScreen(widget._server, widget._userData)));
          });
        },
        child: const Text(
          'SIGN OUT',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
      ),
    );
  }
}
