import 'package:flutter/material.dart';

class ResetPasswordBtn extends StatefulWidget {
  const ResetPasswordBtn({Key? key}) : super(key: key);

  @override
  _ResetPasswordBtnState createState() => _ResetPasswordBtnState();
}

class _ResetPasswordBtnState extends State<ResetPasswordBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}