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
  late TimeSlotsDropDown from;
  late TimeSlotsDropDown to;

  @override
  Widget build(BuildContext context) {
    from = TimeSlotsDropDown(widget.timeSlots, widget.selectedTimeSlot);
    to = TimeSlotsDropDown(widget.timeSlots, widget.selectedTimeSlot);
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
    return widget.timeSlots;
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
