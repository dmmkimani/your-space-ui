import 'package:flutter/material.dart';

class UnavailableBtn extends StatefulWidget {
  const UnavailableBtn({Key? key}) : super(key: key);

  @override
  _UnavailableBtnState createState() => _UnavailableBtnState();
}

class _UnavailableBtnState extends State<UnavailableBtn> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: null,
      child: const Text('Unavailable',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
    );
  }
}
