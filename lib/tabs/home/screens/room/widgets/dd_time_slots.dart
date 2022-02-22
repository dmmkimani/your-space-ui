import 'package:flutter/material.dart';

class TimeSlotsDropDown extends StatefulWidget {
  final List<String> _timeSlots;
  String selectedTimeSlot;
  final bool _isLocked;

  TimeSlotsDropDown(this._timeSlots, this.selectedTimeSlot, this._isLocked,
      {Key? key})
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
        onChanged: !widget._isLocked
            ? (newTimeSlot) {
                setState(() {
                  widget.selectedTimeSlot = newTimeSlot.toString();
                });
              }
            : null,
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
