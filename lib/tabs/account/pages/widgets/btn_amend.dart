import 'package:flutter/material.dart';
import 'package:project/tabs/account/pages/widgets/dialog_amend.dart';

class AmendBtn extends StatefulWidget {
  final Map<String, dynamic> _details;
  final Function _refresh;

  const AmendBtn(this._details, this._refresh, {Key? key}) : super(key: key);

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
              builder: (context) =>
                  AmendDialog(widget._details, widget._refresh));
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: const Icon(Icons.edit, size: 32.5, color: Colors.blue),
      ),
    );
  }
}
