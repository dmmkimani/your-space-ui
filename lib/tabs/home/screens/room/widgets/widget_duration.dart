import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/room/widgets/dd_time_slots.dart';

class BookingDuration extends StatefulWidget {
  final TimeSlotsDropDown _from;
  final TimeSlotsDropDown _to;

  const BookingDuration(this._from, this._to, {Key? key}) : super(key: key);

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
          style: TextStyle(
              fontSize: 16.0, fontStyle: FontStyle.normal),
        ),
        widget._from,
        const Text(
          'To:',
          style: TextStyle(
              fontSize: 16.0, fontStyle: FontStyle.normal),
        ),
        widget._to,
      ],
    );
  }
}