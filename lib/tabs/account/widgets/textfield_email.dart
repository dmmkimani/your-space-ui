import 'package:flutter/material.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  EmailInputState createState() => EmailInputState();
}

class EmailInputState extends State<EmailInput> {
  static final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: email,
        textAlign: TextAlign.start,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Email',
            prefixIcon: Icon(Icons.email)),
      ),
    );
  }
}
