import 'package:flutter/material.dart';

class GH043 extends StatelessWidget {
  const GH043({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(
          'GH043',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
              color: Colors.black
          )
      ),
    );
  }
}