import 'package:flutter/material.dart';

class GH022 extends StatelessWidget {
  const GH022({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(
          'GH022',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
              color: Colors.black
          )
      ),
    );
  }
}