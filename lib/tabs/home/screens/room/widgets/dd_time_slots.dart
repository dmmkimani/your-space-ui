import 'package:flutter/material.dart';

class TimeSlotsDropDown extends StatefulWidget {
  final List<String> _timeSlots;
  String selectedTimeSlot;

  TimeSlotsDropDown(this._timeSlots, this.selectedTimeSlot, {Key? key})
      : super(key: key);

  @override
  _TimeSlotsDropDownState createState() => _TimeSlotsDropDownState();
}

class _TimeSlotsDropDownState extends State<TimeSlotsDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      child: DropdownButton<String>(
        value: widget.selectedTimeSlot,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (newTimeSlot) {
          setState(() {
            widget.selectedTimeSlot = newTimeSlot.toString();
          });
        },
        items: widget._timeSlots.map((String timeSlot) {
          return DropdownMenuItem<String>(
            child: Text(timeSlot),
            value: timeSlot,
          );
        }).toList(),
      ),
    );
  }
}
