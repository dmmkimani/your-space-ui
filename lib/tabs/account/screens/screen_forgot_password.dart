import 'package:flutter/material.dart';
import 'package:project/tabs/account/widgets/widget_input_email.dart';
import 'package:project/tabs/account/widgets/widget_text_forgot_password.dart';
import 'package:project/tabs/account/widgets/widget_icon_lock.dart';
import 'package:project/tabs/account/widgets/widget_btn_reset_password.dart';
import 'package:project/tabs/widgets/widget_app_bar_pop.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

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
    );
  }
}