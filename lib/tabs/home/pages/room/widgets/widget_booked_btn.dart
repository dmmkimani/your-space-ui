import 'package:flutter/material.dart';

class BookedBtn extends StatefulWidget {
  const BookedBtn({Key? key}) : super(key: key);

  @override
  _BookedBtnState createState() => _BookedBtnState();
}

class _BookedBtnState extends State<BookedBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: const Text('Booked', style: TextStyle(color: Colors.white)),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
          backgroundColor: MaterialStateProperty.all(Colors.red)),
    );
  }
}
