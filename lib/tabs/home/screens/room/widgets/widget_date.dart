import 'package:flutter/material.dart';

import '../../../../function_helpers.dart';

class BookingDate extends StatelessWidget {
  final DateTime _date;

  const BookingDate(this._date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        'Date: ' + HelperFunctions().formatDate(_date),
        style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
      ),
    );
  }
}
