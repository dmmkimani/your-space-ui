import 'package:flutter/material.dart';

class EmailInputWidget extends StatefulWidget {
  const EmailInputWidget({Key? key}) : super(key: key);

  @override
  EmailInputWidgetState createState() => EmailInputWidgetState();
}

class EmailInputWidgetState extends State<EmailInputWidget> {
  static final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: email,
            textAlign: TextAlign.start,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
              prefixIcon: Icon(
                Icons.email
              )
            ),
          ),
        ),
      ],
    );
  }
}