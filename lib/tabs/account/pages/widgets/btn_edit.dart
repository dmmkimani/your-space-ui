import 'package:flutter/material.dart';

class EditBtn extends StatefulWidget {
  const EditBtn({Key? key}) : super(key: key);

  @override
  _EditBtnState createState() => _EditBtnState();
}

class _EditBtnState extends State<EditBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: const Icon(Icons.edit, size: 32.5, color: Colors.blue),
      ),
    );
  }
}