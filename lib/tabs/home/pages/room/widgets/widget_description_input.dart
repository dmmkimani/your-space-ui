import 'package:flutter/material.dart';

class DescriptionInput extends StatefulWidget {
  const DescriptionInput({Key? key}) : super(key: key);

  @override
  DescriptionInputState createState() => DescriptionInputState();
}

class DescriptionInputState extends State<DescriptionInput> {
  static final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.done,
      maxLines: 3,
      maxLength: 75,
      controller: description,
      textAlign: TextAlign.start,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Briefly describe the purpose of your booking...',
      ),
    );
  }
}
