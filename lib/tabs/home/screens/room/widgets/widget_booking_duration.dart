import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/room/widgets/dd_time_slots.dart';

class BookingDuration extends StatefulWidget {
  final List<String> _timeSlots;
  final String _selectedTimeSlot;

  const BookingDuration(this._timeSlots, this._selectedTimeSlot, {Key? key})
      : super(key: key);

  @override
  _BookingDurationState createState() => _BookingDurationState();
}

class _BookingDurationState extends State<BookingDuration> {
  late TimeSlotsDropDown from;
  late TimeSlotsDropDown to;

  @override
  Widget build(BuildContext context) {
    from = TimeSlotsDropDown(widget._timeSlots, widget._selectedTimeSlot);
    to = TimeSlotsDropDown(widget._timeSlots, widget._selectedTimeSlot);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'From:',
          style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
        ),
        from,
        const Text(
          'To:',
          style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
        ),
        to,
      ],
    );
  }

  List<String> get timeSlots {
    return widget._timeSlots;
  }

  String get startTime {
    return from.selectedTimeSlot.toString();
  }

  int get duration {
    int fromTimeSlot =
        int.parse(from.selectedTimeSlot.toString().split(':')[0]);
    int toTimeSlot = int.parse(to.selectedTimeSlot.toString().split(':')[0]);
    return (toTimeSlot - fromTimeSlot);
  }
}
