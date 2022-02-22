import 'package:flutter/material.dart';

class SaveBtn extends StatefulWidget {
  final BuildContext _context;
  final Function _amend;

  const SaveBtn(this._context, this._amend, {Key? key}) : super(key: key);

  @override
  _SaveBtnState createState() => _SaveBtnState();
}

class _SaveBtnState extends State<SaveBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          widget._amend(widget._context);
        },
        child: const Text(
          'SAVE',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
      ),
    );
  }
}
