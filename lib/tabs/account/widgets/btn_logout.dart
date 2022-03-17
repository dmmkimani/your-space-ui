import 'package:flutter/material.dart';
import 'package:project/tabs/account/splash_screen_account.dart';
import 'package:project/tabs/provider.dart';

class LogoutBtn extends StatefulWidget {
  const LogoutBtn({Key? key}) : super(key: key);

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
          GlobalData.auth!.signOut().whenComplete(() {
            GlobalData.currentUser = null;
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(
                builder: (context) => const AccountSplashScreen()));
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
