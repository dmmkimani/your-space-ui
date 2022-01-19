import 'package:flutter/material.dart';

class LockIcon extends StatelessWidget {
  const LockIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      padding: const EdgeInsets.all(35.0),
      child: const Icon(
        Icons.lock_outline,
        size: 125.0,
      ),
    );
  }
}