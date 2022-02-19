import 'package:flutter/material.dart';

class BookBtn extends StatefulWidget {
  final BuildContext _context;
  final Function _book;

  const BookBtn(this._context, this._book, {Key? key}) : super(key: key);

  @override
  _BookBtnState createState() => _BookBtnState();
}

class _BookBtnState extends State<BookBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125.0,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          widget._book(widget._context);
        },
        child: const Text(
          'Book',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
            backgroundColor: MaterialStateProperty.all(Colors.green)),
      ),
    );
  }
}
