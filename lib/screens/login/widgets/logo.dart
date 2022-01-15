import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Image.asset(
        'images/su-logo.png',
        width: 300,
        height: 150,
        fit: BoxFit.fill,
      ),
    );
  }
}