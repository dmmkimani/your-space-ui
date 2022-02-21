import 'package:flutter/material.dart';

class DeleteDialog extends StatefulWidget {
  final int _position;
  final Map<String, dynamic> _details;
  final Function _deleteBooking;

  const DeleteDialog(this._position, this._details, this._deleteBooking,
      {Key? key})
      : super(key: key);

  @override
  _DeleteDialogState createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Delete Booking',
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Are you sure you want to delete this booking from your booking history?',
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
                  'CANCEL',
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
                  widget._deleteBooking(widget._position, widget._details);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'DELETE',
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