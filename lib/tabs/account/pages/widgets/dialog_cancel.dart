import 'package:flutter/material.dart';

class CancelDialog extends StatefulWidget {
  final Function _cancel;

  const CancelDialog(this._cancel, {Key? key}) : super(key: key);

  @override
  _CancelDialogState createState() => _CancelDialogState();
}

class _CancelDialogState extends State<CancelDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Cancel Booking',
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Are you sure you want to cancel your booking?',
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'NO',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).pop();
                  widget._cancel();
                },
                child: const Text(
                  'YES',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        )
      ],
      actionsPadding: const EdgeInsets.only(bottom: 20.0),
    );
  }
}
