import 'package:flutter/material.dart';

class BookBtn extends StatefulWidget {
  const BookBtn({Key? key}) : super(key: key);

  @override
  _BookBtnState createState() => _BookBtnState();
}

class _BookBtnState extends State<BookBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Book', style: TextStyle(color: Colors.white)),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
          backgroundColor: MaterialStateProperty.all(Colors.green)),
    );
  }
}