import 'package:flutter/material.dart';

class NumPeople extends StatefulWidget {
  const NumPeople({Key? key}) : super(key: key);

  @override
  NumPeopleState createState() => NumPeopleState();
}

class NumPeopleState extends State<NumPeople> {
  static final numPeople = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: const Text(
            'How many people will be using this space?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
          ),
        ),
        SizedBox(
          width: 50.0,
          height: 45.0,
          child: TextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            maxLength: 3,
            controller: numPeople,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(bottom: 1, left: 2.75),
              counter: Offstage()
            ),
          ),
        )
      ],
    );
  }
}
