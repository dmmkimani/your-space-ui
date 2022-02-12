import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_btn_reserved.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_btn_book_slot.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_btn_unavailable.dart';

class Bookings extends StatefulWidget {
  final Function _reload;
  final String _building;
  final String _room;
  final DateTime _date;
  final Map<String, dynamic> _bookings;

  const Bookings(
      this._reload, this._building, this._room, this._date, this._bookings,
      {Key? key})
      : super(key: key);

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    List<String> _timeSlots = widget._bookings.keys.toList();
    _timeSlots.sort();
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: _timeSlots.length,
          itemBuilder: (BuildContext context, int position) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _timeSlots[position],
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                          width: 125.0,
                          child: isAvailable(
                                  widget._bookings, _timeSlots[position])
                              ? isBooked(widget._bookings, _timeSlots[position])
                                  ? const ReservedBtn()
                                  : isLastTimeSlot(_timeSlots, position)
                                      ? const UnavailableBtn()
                                      : BookSlotBtn(
                                          widget._reload,
                                          widget._building,
                                          widget._room,
                                          widget._date,
                                          _timeSlots,
                                          _timeSlots[position])
                              : const UnavailableBtn())
                    ],
                  ),
                  isLastTimeSlot(_timeSlots, position)
                      ? const Padding(padding: EdgeInsets.only(bottom: 5.0))
                      : const Divider(),
                ],
              ),
            );
          }),
    );
  }

  bool isAvailable(Map<String, dynamic> bookings, String timeSlot) {
    return bookings[timeSlot]['available'];
  }

  bool isBooked(Map<String, dynamic> bookings, String timeSlot) {
    return bookings[timeSlot]['booking']['booked'];
  }

  bool isLastTimeSlot(List<String> timeSlots, int position) {
    return position == (timeSlots.length - 1);
  }
}