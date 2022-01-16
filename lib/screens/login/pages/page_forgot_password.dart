import 'package:flutter/material.dart';
import 'package:project/screens/login/functions/functions_input.dart';
import 'package:project/screens/login/widgets/widget_email_input.dart';
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
                children: [
                  Container (
                    padding: const EdgeInsets.all(35.0),
                    child: const Icon(
                      Icons.lock_outline,
                      size: 125.0,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Text(
                      'Forgot Your Password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: const Text(
                      "Please enter your email address and we'll send you a link to reset your password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                  const EmailInputWidget(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        child: const Text(
                          'Reset Password',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 18.0),
                        ),
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();

                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                leading: IconButton(
                  icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey),
                  onPressed: () {
                    InputFunctions().clearInputs();
                    Navigator.pop(context);
                  },
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.white,
                shape: const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
                title: const Text(
                  'Forgot Your Password?',
                  style: TextStyle(color: Colors.black),
                ),
              )
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}