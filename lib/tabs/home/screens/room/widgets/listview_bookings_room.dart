import 'package:flutter/material.dart';
import 'package:project/tabs/function_helpers.dart';
import 'package:project/tabs/home/screens/room/widgets/btn_reserved.dart';
import 'package:project/tabs/home/screens/room/widgets/btn_book_slot.dart';
import 'package:project/tabs/home/screens/room/widgets/btn_unavailable.dart';

class RoomBookings extends StatefulWidget {
  final Function _reload;
  final String _building;
  final String _room;
  final DateTime _date;
  final Map<String, dynamic> _bookings;

  const RoomBookings(
      this._reload, this._building, this._room, this._date, this._bookings,
      {Key? key})
      : super(key: key);

  @override
  _RoomBookingsState createState() => _RoomBookingsState();
}

class _RoomBookingsState extends State<RoomBookings> {
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
                          child: isAfterNow(
                                      widget._date, timeSlots[position]) &&
                                  isAvailable(
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

  bool isAfterNow(DateTime selectedDate, String timeSlot) {
    String date = widget._date.day.toString() +
        '.' +
        widget._date.month.toString() +
        '.' +
        widget._date.year.toString();

    return DateTime.now().isBefore(HelperFunctions().parseDate(date, timeSlot));
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
