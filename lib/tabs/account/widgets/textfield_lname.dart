import 'package:flutter/material.dart';

class LNameInput extends StatefulWidget {
  const LNameInput({Key? key}) : super(key: key);

  @override
  LNameInputState createState() => LNameInputState();
}

class LNameInputState extends State<LNameInput> {
  static final lName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: TextField(
          keyboardType: TextInputType.text,
          controller: lName,
          textAlign: TextAlign.start,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Last Name',
          ),
        ));
  }
}
