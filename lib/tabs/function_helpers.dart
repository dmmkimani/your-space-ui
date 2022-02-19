import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperFunctions {
  String formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

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