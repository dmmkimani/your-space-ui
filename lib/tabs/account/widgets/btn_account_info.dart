import 'package:flutter/material.dart';

class AccountInfoBtn extends StatefulWidget {
  final bool isSelected;

  const AccountInfoBtn(this.isSelected, {Key? key}) : super(key: key);

  @override
  _AccountInfoBtnState createState() => _AccountInfoBtnState();
}

class _AccountInfoBtnState extends State<AccountInfoBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 65.0,
          height: 65.0,
          child: Icon(
            Icons.info_outline,
            size: 50.0,
            color: widget.isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        Text(
          'Account Information',
          style:
              TextStyle(color: widget.isSelected ? Colors.blue : Colors.grey),
        ),
      ],
    );
  }
}
