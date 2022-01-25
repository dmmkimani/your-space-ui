import 'package:flutter/material.dart';

import 'package:project/server/localhost.dart';

import 'package:project/tabs/home/pages/room/widgets/widget_amenities_table.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_bookings.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_calendar.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_capacity.dart';
import 'package:project/widgets/widget_bottom_nav_bar.dart';

class Room extends StatefulWidget {
  final String building;
  final String room;

  const Room(this.building, this.room, {Key? key}) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  DateTime currentDate = DateTime.now();
  late DateTime selectedDate;

  @override
  void initState() {
    selectedDate = currentDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FutureBuilder(
              future: loadWidgets(),
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  Map<String, dynamic> details =
                      snapshot.requireData['roomDetails'];
                  Map<String, dynamic> bookings =
                      snapshot.requireData['roomBookings'];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CapacityWidget(details['capacity']),
                      AmenitiesTable(details['amenities']),
                      Calendar(widget.building, widget.room, currentDate,
                          changeDate),
                      Expanded(child: Bookings(bookings))
                    ],
                  );
                }
              })),
      bottomNavigationBar: BottomNavBar(0),
    );
  }

  Future<Map<String, dynamic>> loadWidgets() async {
    return {
      'roomDetails':
          await LocalHost().getRoomDetails(widget.building, widget.room),
      'roomBookings': await LocalHost()
          .getBookings(widget.building, widget.room, formatDate(selectedDate))
    };
  }

  void changeDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  String formatDate(DateTime date) {
    return date.day.toString() +
        '.' +
        date.month.toString() +
        '.' +
        date.year.toString();
  }
}
