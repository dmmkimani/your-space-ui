import 'package:flutter/material.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_btn_reserved.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_btn_book.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_btn_unavailable.dart';

class Bookings extends StatefulWidget {
  final Map<String, dynamic> bookings;

  const Bookings(this.bookings, {Key? key}) : super(key: key);

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    List<String> timeSlots = widget.bookings.keys.toList();
    timeSlots.sort();
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: timeSlots.length,
        itemBuilder: (BuildContext context, int position) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: (position != (timeSlots.length - 1))
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.5)))
                  : null,
              child: Row(
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
                      child: isAvailable(widget.bookings, timeSlots[position])
                          ? isBooked(widget.bookings, timeSlots[position])
                              ? const ReservedBtn()
                              : const BookBtn()
                          : const UnavailableBtn())
                ],
              ),
            ),
          );
        });
  }

  bool isAvailable(Map<String, dynamic> bookings, String timeSlot) {
    return bookings[timeSlot]['available'];
  }

  bool isBooked(Map<String, dynamic> bookings, String timeSlot) {
    return bookings[timeSlot]['booked'];
  }
}
