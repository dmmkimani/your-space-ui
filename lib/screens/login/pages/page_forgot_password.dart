import 'package:flutter/material.dart';
import 'package:project/screens/login/widgets/widget_email_input.dart';
import 'package:project/screens/login/widgets/widget_forgot_password_text.dart';
import 'package:project/screens/login/widgets/widget_lock_icon.dart';
import 'package:project/screens/login/widgets/widget_reset_password_btn.dart';
import 'package:project/widgets/widget_app_bar_with_pop.dart';
import 'package:project/widgets/widget_bottom_nav_bar.dart';

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
                  EmailInputWidget(),
                  ResetPasswordBtn()
                ],
              ),
            ),
          ),
          CustomAppBarWithPop(context, 'Forgot Your Password?')
        ],
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}