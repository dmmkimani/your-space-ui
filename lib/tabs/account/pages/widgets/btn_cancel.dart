import 'package:flutter/material.dart';

class CancelBtn extends StatefulWidget {
  const CancelBtn({Key? key}) : super(key: key);

  @override
  _CancelBtnState createState() => _CancelBtnState();
}

class _CancelBtnState extends State<CancelBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          'CANCEL THIS BOOKING',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
            backgroundColor: MaterialStateProperty.all(Colors.red)),
      ),
    );
  }
}
