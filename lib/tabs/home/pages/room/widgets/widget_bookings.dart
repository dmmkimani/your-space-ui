import 'package:flutter/material.dart';
import 'package:project/server/localhost.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_booked_btn.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_btn_book.dart';

class Bookings extends StatefulWidget {
  final String building;
  final String room;
  final String date;

  const Bookings(this.building, this.room, this.date, {Key? key})
      : super(key: key);

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            LocalHost().getBookings(widget.building, widget.room, widget.date),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.data == null) {
            return Container(
              padding: const EdgeInsets.only(top: 100.0),
              child: const CircularProgressIndicator(),
            );
          } else {
            List<String> timeSlots = snapshot.requireData.keys.toList();
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
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.5)))
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
                              child: isBooked(
                                      snapshot.requireData, timeSlots[position])
                                  ? const BookedBtn()
                                  : const BookBtn())
                        ],
                      ),
                    ),
                  );
                });
          }
        });
  }

  bool isBooked(Map<String, dynamic> bookings, String timeSlot) {
    return bookings[timeSlot]['booked'];
  }
}
