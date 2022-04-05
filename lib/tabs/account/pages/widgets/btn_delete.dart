import 'package:flutter/material.dart';
import 'package:project/server/server.dart';

import 'package:project/tabs/account/pages/widgets/dialog_delete.dart';

class DeleteBtn extends StatefulWidget {
  final Server _server;
  final int _position;
  final Map<String, dynamic> _details;
  final Function _deleteBooking;

  const DeleteBtn(
      this._server, this._position, this._details, this._deleteBooking,
      {Key? key})
      : super(key: key);

  @override
  _DeleteBtnState createState() => _DeleteBtnState();
}

class _DeleteBtnState extends State<DeleteBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => DeleteDialog(widget._server,
                  widget._position, widget._details, widget._deleteBooking));
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: const Icon(Icons.delete, size: 32.5, color: Colors.red),
      ),
    );
  }
}
