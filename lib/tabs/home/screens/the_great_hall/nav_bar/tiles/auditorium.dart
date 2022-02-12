import 'package:flutter/material.dart';

class Auditorium extends StatelessWidget {
  const Auditorium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(
          'Sir Stanley Clarke Auditorium',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Colors.black
          )
      ),
    );
  }
}