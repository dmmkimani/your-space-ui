import 'package:flutter/material.dart';

import 'package:date_picker_timeline/date_picker_timeline.dart';

class Calendar extends StatefulWidget {
  final String building;
  final String room;
  DateTime selectedDate;

  Calendar(this.building, this.room, this.selectedDate, {Key? key})
      : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return DatePicker(
          widget.selectedDate,
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.lightBlue,
          selectedTextColor: Colors.white,
          onDateChange: (date) {},
    );
  }
}
