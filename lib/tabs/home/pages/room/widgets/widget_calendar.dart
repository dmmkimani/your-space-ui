import 'package:flutter/material.dart';

import 'package:date_picker_timeline/date_picker_timeline.dart';

class Calendar extends StatefulWidget {
  final String building;
  final String room;
  final DateTime selectedDate;
  final Function changeDate;

  const Calendar(this.building, this.room, this.selectedDate, this.changeDate,
      {Key? key})
      : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: DatePicker(
        widget.selectedDate,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.lightBlue,
        selectedTextColor: Colors.white,
        onDateChange: (date) {
          widget.changeDate(date);
        },
      ),
    );
  }
}
