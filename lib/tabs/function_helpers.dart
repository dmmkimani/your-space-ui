import 'package:flutter/material.dart';

class HelperFunctions {
  void showSnackBar(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    Future.delayed(const Duration(milliseconds: 500), () {
      scaffold.showSnackBar(
          SnackBar(
              content: Text(message)
          )
      );
    });
  }
}