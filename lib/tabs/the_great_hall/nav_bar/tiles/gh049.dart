import 'package:flutter/material.dart';

class GH049 extends StatelessWidget {
  const GH049({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(
          'GH049',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
              color: Colors.black
          )
      ),
    );
  }

}