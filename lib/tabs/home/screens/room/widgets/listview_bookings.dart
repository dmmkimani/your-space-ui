import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/room/widgets/btn_reserved.dart';
import 'package:project/tabs/home/screens/room/widgets/btn_book_slot.dart';
import 'package:project/tabs/home/screens/room/widgets/btn_unavailable.dart';

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
    List<String> timeSlots = widget._bookings.keys.toList();
    timeSlots.sort();
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: timeSlots.length,
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
                        timeSlots[position],
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                          width: 125.0,
                          child: isAvailable(
                                  widget._bookings, timeSlots[position])
                              ? isBooked(widget._bookings, timeSlots[position])
                                  ? const ReservedBtn()
                                  : isLastTimeSlot(timeSlots, position)
                                      ? const UnavailableBtn()
                                      : BookSlotBtn(
                                          widget._reload,
                                          widget._building,
                                          widget._room,
                                          widget._date,
                                          timeSlots,
                                          timeSlots[position])
                              : const UnavailableBtn())
                    ],
                  ),
                  isLastTimeSlot(timeSlots, position)
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
    return bookings[timeSlot]['booked'];
  }

  bool isLastTimeSlot(List<String> timeSlots, int position) {
    return position == (timeSlots.length - 1);
  }
}
