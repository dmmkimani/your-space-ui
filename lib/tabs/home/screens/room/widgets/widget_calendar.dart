import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class Calendar extends StatefulWidget {
  final DateTime _currentDate;
  final Function _changeDate;

  const Calendar(this._currentDate, this._changeDate,
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
        widget._currentDate,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.lightBlue,
        selectedTextColor: Colors.white,
        onDateChange: (date) {
          widget._changeDate(date);
        },
      ),
    );
  }
}
