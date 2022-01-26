import 'package:flutter/material.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_drop_down_time_slots.dart';

class BookingDuration extends StatefulWidget {
  final List<String> timeSlots;
  final String selectedTimeSlot;

  const BookingDuration(this.timeSlots, this.selectedTimeSlot, {Key? key})
      : super(key: key);

  @override
  _BookingDurationState createState() => _BookingDurationState();
}

class _BookingDurationState extends State<BookingDuration> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'From:',
          style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
        ),
        TimeSlotsDropDown(widget.timeSlots, widget.selectedTimeSlot),
        const Text(
          'To:',
          style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
        ),
        TimeSlotsDropDown(widget.timeSlots, widget.selectedTimeSlot),
      ],
    );
  }
}
