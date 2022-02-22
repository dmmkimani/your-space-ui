import 'package:flutter/material.dart';

class ReservedBtn extends StatefulWidget {
  const ReservedBtn({Key? key}) : super(key: key);

  @override
  _ReservedBtnState createState() => _ReservedBtnState();
}

class _ReservedBtnState extends State<ReservedBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: const Text('Reserved',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
          backgroundColor: MaterialStateProperty.all(Colors.red)),
    );
  }
}
