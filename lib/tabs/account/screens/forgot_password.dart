import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/account/widgets/textfield_email.dart';
import 'package:project/tabs/account/widgets/text_reset_password.dart';
import 'package:project/tabs/account/widgets/icon_lock.dart';
import 'package:project/tabs/account/widgets/btn_reset_password.dart';
import 'package:project/tabs/provider.dart';
import 'package:project/tabs/widgets/app_bar_pop.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

class ForgotPasswordPage extends StatefulWidget {
  final Server _server;
  final UserData _userData;

  const ForgotPasswordPage(this._server, this._userData, {Key? key})
      : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                children: const [
                  LockIcon(),
                  ForgotPasswordText(),
                  EmailInput(),
                  ResetPasswordBtn()
                ],
              ),
            ),
          ),
          PopAppBar(context, 'Forgot Your Password?')
        ],
      ),
      bottomNavigationBar: BottomNavBar(widget._server, widget._userData, 1),
    );
  }
}
