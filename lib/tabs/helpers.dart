import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperFunctions {
  String formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

  DateTime parseDate(String date, String hour) {
    String day = date.split('.')[0].toString();
    String month = date.split('.')[1].toString();
    String year = date.split('.')[2].split('-')[0].toString();

    if (day.length == 1) {
      day = '0$day';
    }
    if (month.length == 1) {
      month = '0$month';
    }

    return DateTime.parse('$year-$month-$day $hour:00.000');
  }

  int timeSlotToInt(String timeSlot) {
    return int.parse(timeSlot.split(':')[0]);
  }

  String intToTimeSlot(int i) {
    String time = i.toString();
    if (time.length == 2) {
      return time + ':00';
    } else {
      return '0' + time + ':00';
    }
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