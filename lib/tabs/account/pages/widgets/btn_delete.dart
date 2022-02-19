import 'package:flutter/material.dart';

class DeleteBtn extends StatefulWidget {
  const DeleteBtn({Key? key}) : super(key: key);

  @override
  _DeleteBtnState createState() => _DeleteBtnState();
}

class _DeleteBtnState extends State<DeleteBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: const Icon(Icons.delete, size: 32.5, color: Colors.red),
      ),
    );
  }
}
