import 'package:flutter/material.dart';

class FNameInput extends StatefulWidget {
  const FNameInput({Key? key}) : super(key: key);

  @override
  FNameInputState createState() => FNameInputState();
}

class FNameInputState extends State<FNameInput> {
  static final fName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: TextField(
          keyboardType: TextInputType.text,
          controller: fName,
          textAlign: TextAlign.start,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'First Name',
          ),
        ));
  }
}
