import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/account/pages/widgets/dialog_amend.dart';
import 'package:project/tabs/provider.dart';

class AmendBtn extends StatefulWidget {
  final Server _server;
  final UserData _userData;
  final int _position;
  final Map<String, dynamic> _details;
  final Function _refresh;
  final Function _removeFromList;

  const AmendBtn(this._server, this._userData, this._position, this._details,
      this._refresh, this._removeFromList,
      {Key? key})
      : super(key: key);

  @override
  _AmendBtnState createState() => _AmendBtnState();
}

class _AmendBtnState extends State<AmendBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AmendDialog(
                  widget._server,
                  widget._userData,
                  widget._position,
                  widget._details,
                  widget._refresh,
                  widget._removeFromList));
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: const Icon(Icons.edit, size: 32.5, color: Colors.blue),
      ),
    );
  }
}
